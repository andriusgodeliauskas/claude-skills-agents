---
name: design-scraper
description: Scrapes design inspiration from Dribbble, Behance, Awwwards, portfolio sites, and any design showcase URL. Downloads all images, extracts color palettes, identifies fonts, captures layout structure, and saves screenshots. Use when user provides a link to a design showcase (Dribbble shot, Behance project, Awwwards site, Pinterest board, or any portfolio/design URL) and wants to understand or replicate the design. Outputs a complete design reference package with images, colors, fonts, layout notes, and screenshots.
---

# Design Scraper Skill

## WHEN TO USE
User says something like:
- "Here's a Dribbble link, I want a similar design"
- "Scrape this design for reference"
- "Download the images from this Behance project"
- "I like this design, analyze it"
- Any URL to: dribbble.com, behance.net, awwwards.com, pinterest.com, or portfolio sites

## PROCESS — STEP BY STEP

### STEP 1: Fetch the page
```bash
# Create working directory
mkdir -p /home/claude/design-scrape/{images,screenshots,analysis}

# Fetch page HTML
curl -L -s -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
  -o /home/claude/design-scrape/page.html \
  "$URL"
```

Use `web_fetch` tool to get the full page content. This is preferred over curl when available.

### STEP 2: Extract ALL images
```python
#!/usr/bin/env python3
"""extract_images.py — Extract and download all design images from page"""
import re
import os
import json
import urllib.request
import urllib.parse
from html.parser import HTMLParser

class ImageExtractor(HTMLParser):
    def __init__(self, base_url):
        super().__init__()
        self.images = []
        self.base_url = base_url
        self.og_images = []
        self.meta_images = []

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)

        # Regular images
        if tag == 'img':
            src = attrs.get('src') or attrs.get('data-src') or attrs.get('data-lazy-src') or attrs.get('srcset', '').split(',')[0].strip().split(' ')[0]
            if src:
                self.images.append({
                    'src': self._resolve(src),
                    'alt': attrs.get('alt', ''),
                    'type': 'img',
                    'width': attrs.get('width', ''),
                    'height': attrs.get('height', '')
                })

        # Background images in style attribute
        if attrs.get('style'):
            bg_urls = re.findall(r'url\(["\']?(.*?)["\']?\)', attrs['style'])
            for bg in bg_urls:
                self.images.append({
                    'src': self._resolve(bg),
                    'alt': '',
                    'type': 'background-image'
                })

        # Open Graph images
        if tag == 'meta':
            prop = attrs.get('property', '') or attrs.get('name', '')
            if 'image' in prop.lower() and attrs.get('content'):
                self.og_images.append(self._resolve(attrs['content']))

        # Video posters
        if tag == 'video' and attrs.get('poster'):
            self.images.append({
                'src': self._resolve(attrs['poster']),
                'alt': 'video-poster',
                'type': 'video-poster'
            })

        # Source tags (for picture elements and videos)
        if tag == 'source':
            srcset = attrs.get('srcset', '')
            if srcset:
                src = srcset.split(',')[0].strip().split(' ')[0]
                self.images.append({
                    'src': self._resolve(src),
                    'alt': '',
                    'type': 'source'
                })

    def _resolve(self, url):
        if url.startswith('data:'):
            return url
        if url.startswith('//'):
            return 'https:' + url
        if url.startswith('/'):
            from urllib.parse import urlparse
            p = urlparse(self.base_url)
            return f"{p.scheme}://{p.netloc}{url}"
        if not url.startswith('http'):
            return urllib.parse.urljoin(self.base_url, url)
        return url

def download_images(images, output_dir):
    """Download unique images, skip tiny icons and data URIs"""
    downloaded = []
    seen_urls = set()

    for i, img in enumerate(images):
        src = img['src']
        if src.startswith('data:') or src in seen_urls:
            continue
        seen_urls.add(src)

        # Skip common icon/tracking patterns
        skip_patterns = ['favicon', 'pixel', 'tracking', 'analytics', '1x1', 'spacer', '.svg']
        if any(p in src.lower() for p in skip_patterns):
            continue

        ext = '.jpg'
        for e in ['.png', '.jpg', '.jpeg', '.webp', '.gif', '.avif']:
            if e in src.lower():
                ext = e
                break

        filename = f"design-{i:03d}{ext}"
        filepath = os.path.join(output_dir, filename)

        try:
            req = urllib.request.Request(src, headers={
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
            })
            with urllib.request.urlopen(req, timeout=10) as resp:
                data = resp.read()
                # Skip files smaller than 2KB (likely icons/spacers)
                if len(data) > 2048:
                    with open(filepath, 'wb') as f:
                        f.write(data)
                    downloaded.append({
                        'file': filename,
                        'original_url': src,
                        'alt': img.get('alt', ''),
                        'type': img.get('type', 'img'),
                        'size_kb': round(len(data) / 1024, 1)
                    })
        except Exception as e:
            pass

    return downloaded

if __name__ == '__main__':
    import sys
    url = sys.argv[1]
    html_file = '/home/claude/design-scrape/page.html'
    output_dir = '/home/claude/design-scrape/images'

    with open(html_file, 'r', errors='ignore') as f:
        html = f.read()

    extractor = ImageExtractor(url)
    extractor.feed(html)

    # Also extract from CSS background-image patterns in the HTML
    css_bgs = re.findall(r'url\(["\']?(https?://[^"\')\s]+)["\']?\)', html)
    for bg in css_bgs:
        extractor.images.append({'src': bg, 'alt': '', 'type': 'css-background'})

    all_images = extractor.images
    downloaded = download_images(all_images, output_dir)

    # Save manifest
    manifest = {
        'source_url': url,
        'total_found': len(all_images),
        'downloaded': len(downloaded),
        'og_images': extractor.og_images,
        'files': downloaded
    }

    with open('/home/claude/design-scrape/analysis/images-manifest.json', 'w') as f:
        json.dump(manifest, f, indent=2)

    print(f"Found {len(all_images)} images, downloaded {len(downloaded)}")
```

### STEP 3: Extract Color Palette
```python
#!/usr/bin/env python3
"""extract_colors.py — Extract dominant colors from downloaded images"""
import os
import json
from collections import Counter

try:
    from PIL import Image
except ImportError:
    import subprocess
    subprocess.run(['pip', 'install', 'Pillow', '--break-system-packages', '-q'])
    from PIL import Image

def get_dominant_colors(image_path, num_colors=6):
    """Extract dominant colors from an image"""
    try:
        img = Image.open(image_path)
        img = img.convert('RGB')
        img = img.resize((150, 150))  # Speed up processing

        pixels = list(img.getdata())
        # Quantize to reduce similar colors
        quantized = []
        for r, g, b in pixels:
            qr = round(r / 32) * 32
            qg = round(g / 32) * 32
            qb = round(b / 32) * 32
            quantized.append((min(qr, 255), min(qg, 255), min(qb, 255)))

        counter = Counter(quantized)
        # Filter out near-white and near-black
        filtered = {k: v for k, v in counter.items()
                    if not (k[0] > 240 and k[1] > 240 and k[2] > 240)
                    and not (k[0] < 15 and k[1] < 15 and k[2] < 15)}

        if not filtered:
            filtered = counter

        common = sorted(filtered.items(), key=lambda x: -x[1])[:num_colors]
        return [{'hex': f'#{r:02x}{g:02x}{b:02x}', 'rgb': f'rgb({r},{g},{b})', 'count': c}
                for (r, g, b), c in common]
    except:
        return []

def analyze_all_images(images_dir):
    all_colors = Counter()
    per_image = {}

    for f in sorted(os.listdir(images_dir)):
        if f.lower().endswith(('.jpg', '.jpeg', '.png', '.webp')):
            path = os.path.join(images_dir, f)
            colors = get_dominant_colors(path)
            per_image[f] = colors
            for c in colors:
                all_colors[c['hex']] += c['count']

    # Top colors across all images
    top = [{'hex': hex, 'usage': count} for hex, count in all_colors.most_common(12)]

    return {
        'palette': top,
        'per_image': per_image
    }

if __name__ == '__main__':
    result = analyze_all_images('/home/claude/design-scrape/images')

    with open('/home/claude/design-scrape/analysis/color-palette.json', 'w') as f:
        json.dump(result, f, indent=2)

    print("=== DOMINANT COLORS ===")
    for c in result['palette'][:8]:
        print(f"  {c['hex']}")
```

### STEP 4: Extract Typography & Fonts
```python
#!/usr/bin/env python3
"""extract_fonts.py — Identify fonts used in the design"""
import re
import json

with open('/home/claude/design-scrape/page.html', 'r', errors='ignore') as f:
    html = f.read()

fonts = {
    'google_fonts': [],
    'font_families': [],
    'font_imports': [],
    'typography_css': []
}

# Google Fonts links
gf_links = re.findall(r'fonts\.googleapis\.com/css2?\?family=([^"\'&>]+)', html)
for link in gf_links:
    families = link.replace('+', ' ').split('|')
    for fam in families:
        name = fam.split(':')[0].strip()
        fonts['google_fonts'].append(name)

# @font-face declarations
font_faces = re.findall(r'@font-face\s*\{[^}]+\}', html, re.DOTALL)
for ff in font_faces:
    family = re.search(r'font-family:\s*["\']?([^"\';\}]+)', ff)
    if family:
        fonts['font_families'].append(family.group(1).strip())

# CSS font-family usage
font_families = re.findall(r'font-family:\s*([^;}{]+)', html)
for ff in font_families:
    clean = ff.strip().strip('"\'')
    if clean and clean not in ['inherit', 'initial', 'unset']:
        fonts['font_families'].append(clean)

fonts['font_families'] = list(set(fonts['font_families']))
fonts['google_fonts'] = list(set(fonts['google_fonts']))

# Font sizes
sizes = re.findall(r'font-size:\s*([^;}{]+)', html)
fonts['font_sizes'] = list(set(s.strip() for s in sizes))

# Font weights
weights = re.findall(r'font-weight:\s*([^;}{]+)', html)
fonts['font_weights'] = list(set(w.strip() for w in weights))

with open('/home/claude/design-scrape/analysis/typography.json', 'w') as f:
    json.dump(fonts, f, indent=2)

print("=== FONTS FOUND ===")
if fonts['google_fonts']:
    print(f"  Google Fonts: {', '.join(fonts['google_fonts'])}")
if fonts['font_families']:
    print(f"  Font families: {', '.join(fonts['font_families'][:10])}")
```

### STEP 5: Extract Layout Structure
```python
#!/usr/bin/env python3
"""extract_layout.py — Analyze page structure and layout patterns"""
import re
import json
from html.parser import HTMLParser

class LayoutAnalyzer(HTMLParser):
    def __init__(self):
        super().__init__()
        self.sections = []
        self.nav_items = []
        self.headings = []
        self.links = []
        self.forms = []
        self.current_tag = None
        self.current_text = ''
        self.depth = 0
        self.in_nav = False
        self.tag_counts = {}

    def handle_starttag(self, tag, attrs):
        attrs_dict = dict(attrs)
        self.tag_counts[tag] = self.tag_counts.get(tag, 0) + 1
        self.current_tag = tag

        if tag == 'nav':
            self.in_nav = True

        if tag == 'a' and self.in_nav:
            href = attrs_dict.get('href', '')
            self.nav_items.append({'href': href, 'text': ''})

        if tag == 'section' or tag == 'main' or tag == 'article':
            cls = attrs_dict.get('class', '')
            id_ = attrs_dict.get('id', '')
            self.sections.append({'tag': tag, 'class': cls, 'id': id_})

        if tag == 'a':
            href = attrs_dict.get('href', '')
            self.links.append(href)

        if tag == 'form':
            self.forms.append({
                'action': attrs_dict.get('action', ''),
                'method': attrs_dict.get('method', 'get'),
                'class': attrs_dict.get('class', '')
            })

    def handle_endtag(self, tag):
        if tag == 'nav':
            self.in_nav = False

    def handle_data(self, data):
        text = data.strip()
        if not text:
            return

        if self.current_tag in ['h1', 'h2', 'h3', 'h4', 'h5', 'h6']:
            self.headings.append({'level': self.current_tag, 'text': text[:100]})

        if self.in_nav and self.nav_items:
            self.nav_items[-1]['text'] = text

with open('/home/claude/design-scrape/page.html', 'r', errors='ignore') as f:
    html = f.read()

analyzer = LayoutAnalyzer()
analyzer.feed(html)

# Extract CSS layout patterns
grid_usage = len(re.findall(r'display:\s*grid', html))
flex_usage = len(re.findall(r'display:\s*flex', html))
has_carousel = bool(re.search(r'carousel|slider|swiper|slick', html, re.I))
has_lightbox = bool(re.search(r'lightbox|fancybox|magnific|modal.*image', html, re.I))
has_parallax = bool(re.search(r'parallax', html, re.I))
has_animation = bool(re.search(r'@keyframes|animate__|gsap|aos|scroll.*reveal', html, re.I))

layout = {
    'navigation': [item for item in analyzer.nav_items if item['text']],
    'sections': analyzer.sections[:30],
    'headings': analyzer.headings[:30],
    'internal_links': list(set(l for l in analyzer.links if l.startswith('/') or l.startswith('#')))[:30],
    'external_links': list(set(l for l in analyzer.links if l.startswith('http')))[:20],
    'forms': analyzer.forms,
    'tag_counts': {k: v for k, v in sorted(analyzer.tag_counts.items(), key=lambda x: -x[1])[:20]},
    'css_features': {
        'grid_usage': grid_usage,
        'flex_usage': flex_usage,
        'has_carousel': has_carousel,
        'has_lightbox': has_lightbox,
        'has_parallax': has_parallax,
        'has_animation': has_animation
    }
}

with open('/home/claude/design-scrape/analysis/layout-structure.json', 'w') as f:
    json.dump(layout, f, indent=2)

print("=== LAYOUT ANALYSIS ===")
print(f"  Nav items: {len(layout['navigation'])}")
print(f"  Sections: {len(layout['sections'])}")
print(f"  Headings: {len(layout['headings'])}")
print(f"  CSS Grid: {grid_usage}x | Flexbox: {flex_usage}x")
print(f"  Carousel: {has_carousel} | Lightbox: {has_lightbox} | Parallax: {has_parallax}")
```

### STEP 6: Generate Design Reference Document
```python
#!/usr/bin/env python3
"""generate_reference.py — Create a comprehensive design reference markdown"""
import json
import os

# Load analysis files
def load_json(path):
    try:
        with open(path) as f: return json.load(f)
    except: return {}

images = load_json('/home/claude/design-scrape/analysis/images-manifest.json')
colors = load_json('/home/claude/design-scrape/analysis/color-palette.json')
fonts = load_json('/home/claude/design-scrape/analysis/typography.json')
layout = load_json('/home/claude/design-scrape/analysis/layout-structure.json')

url = images.get('source_url', 'Unknown')

md = f"""# Design Reference: {url}

## Source
- **URL**: {url}
- **Images found**: {images.get('total_found', 0)}
- **Images downloaded**: {images.get('downloaded', 0)}

---

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
"""

for c in colors.get('palette', [])[:10]:
    md += f"| 🟩 | `{c['hex']}` | {c['usage']} |\n"

md += f"""
---

## Typography

### Fonts
- **Google Fonts**: {', '.join(fonts.get('google_fonts', ['Not detected']))}
- **Font Families**: {', '.join(fonts.get('font_families', ['Not detected'])[:8])}

### Font Sizes Used
{', '.join(fonts.get('font_sizes', [])[:10])}

### Font Weights
{', '.join(fonts.get('font_weights', [])[:6])}

---

## Layout Structure

### Navigation
"""

for item in layout.get('navigation', [])[:15]:
    md += f"- [{item['text']}]({item['href']})\n"

md += "\n### Page Sections\n"
for sec in layout.get('sections', [])[:15]:
    md += f"- `<{sec['tag']}>` class=\"{sec['class']}\" id=\"{sec['id']}\"\n"

md += "\n### Content Headings\n"
for h in layout.get('headings', [])[:20]:
    level = int(h['level'][1])
    md += f"{'  ' * (level-1)}- **{h['level'].upper()}**: {h['text']}\n"

css = layout.get('css_features', {})
md += f"""
### CSS Features
- Grid: {'Yes (' + str(css.get('grid_usage', 0)) + 'x)' if css.get('grid_usage') else 'No'}
- Flexbox: {'Yes (' + str(css.get('flex_usage', 0)) + 'x)' if css.get('flex_usage') else 'No'}
- Carousel/Slider: {'Yes' if css.get('has_carousel') else 'No'}
- Lightbox: {'Yes' if css.get('has_lightbox') else 'No'}
- Parallax: {'Yes' if css.get('has_parallax') else 'No'}
- Animations: {'Yes' if css.get('has_animation') else 'No'}

---

## Downloaded Images

| File | Size | Type | Alt Text |
|------|------|------|----------|
"""

for img in images.get('files', [])[:30]:
    md += f"| {img['file']} | {img['size_kb']}KB | {img['type']} | {img.get('alt', '')[:40]} |\n"

md += """
---

## How to Use This Reference

1. Review the downloaded images in the `images/` folder
2. Use the color palette as CSS custom properties
3. Import the identified Google Fonts
4. Follow the layout structure for page sections
5. Combine with design skills (01-24) to match the style
"""

with open('/home/claude/design-scrape/DESIGN-REFERENCE.md', 'w') as f:
    f.write(md)

print("Design reference saved to DESIGN-REFERENCE.md")
```

### STEP 7: Package everything
```bash
# Create final package
cd /home/claude/design-scrape
zip -r /mnt/user-data/outputs/design-reference.zip \
  images/ analysis/ DESIGN-REFERENCE.md

# Present to user
```

---

## PLATFORM-SPECIFIC NOTES

### Dribbble
- Main shot image: look for `img` inside `.media-content` or `data-src` attributes
- Multiple shots in a project: scroll through attached images
- OG image meta tag often has the best quality version
- Full-size images: replace `-small` or `-400x300` with `-original` in URL

### Behance
- Project images: `img` inside `.ImageElement-image` or `.js-project-cover`
- Behance serves images via `mir-s3-cdn-cf.behance.net`
- Modules: each project module may have different image sizes
- Look for `srcset` attributes for highest resolution

### Awwwards
- Site screenshots: inside `.entry__media` or `.gallery`
- Often lazy-loaded with `data-src`

### Pinterest
- Pin images: `img` with `src` containing `pinimg.com`
- Replace `/236x/` with `/originals/` for full size

### General Portfolio Sites
- Background images in CSS/inline styles
- Lazy-loaded images (`data-src`, `data-lazy`, `loading="lazy"`)
- Video posters for autoplay background videos

---

## WHAT THE SKILL OUTPUTS

```
design-scrape/
├── images/                    # All downloaded design images
│   ├── design-000.jpg
│   ├── design-001.png
│   └── ...
├── analysis/
│   ├── images-manifest.json   # Image URLs, sizes, types
│   ├── color-palette.json     # Dominant colors extracted
│   ├── typography.json        # Fonts, sizes, weights
│   └── layout-structure.json  # Sections, nav, CSS features
└── DESIGN-REFERENCE.md        # Human-readable summary
```

---

## IMPORTANT NOTES

- This skill uses `web_fetch` tool (preferred) or `curl` as fallback
- Some sites block scraping — may need different User-Agent
- Image quality varies — always check for higher-res versions
- Color extraction requires Pillow (`pip install Pillow --break-system-packages`)
- For video content: extract poster frames, note video sections in reference
- Always respect copyright — designs are for reference/inspiration only, not direct copying
