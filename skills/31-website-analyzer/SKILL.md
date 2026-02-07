---
name: website-analyzer
description: Complete analysis of a live website for recreation/cloning. Takes a URL and produces full documentation — all pages discovered, screenshots, HTML structure, CSS styles, fonts, colors, images, navigation, layout patterns, components, responsive behavior, animations, third-party services. Creates a comprehensive blueprint that another developer (or AI agent) can use to build an identical or similar website from scratch. Use when user provides a live website URL and wants to understand its structure, design, or recreate it.
---

# Website Analyzer Skill

## WHEN TO USE
User says something like:
- "Analyze this website: [URL]"
- "I want to build something like this: [URL]"
- "Clone this site design"
- "Show me how this website is built"
- "What technologies does this site use?"

## PROCESS — STEP BY STEP

### STEP 1: Setup & Fetch Main Page

```bash
mkdir -p /home/claude/site-analysis/{screenshots,pages,assets,css-extracted}
```

Use `web_fetch` tool to get the main page HTML first. Save to `/home/claude/site-analysis/pages/index.html`.

### STEP 2: Discover All Pages

```python
#!/usr/bin/env python3
"""discover_pages.py — Find all internal pages from navigation and links"""
import re
import json
from urllib.parse import urlparse, urljoin
from html.parser import HTMLParser

class LinkExtractor(HTMLParser):
    def __init__(self, base_url):
        super().__init__()
        self.base = base_url
        self.parsed_base = urlparse(base_url)
        self.links = set()
        self.nav_links = []
        self.footer_links = []
        self.in_nav = False
        self.in_footer = False
        self.current_text = ''

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)

        if tag == 'nav':
            self.in_nav = True
        if tag in ['footer'] or 'footer' in attrs.get('class', '').lower():
            self.in_footer = True

        if tag == 'a':
            href = attrs.get('href', '')
            if not href or href.startswith(('#', 'javascript:', 'mailto:', 'tel:')):
                return

            full_url = urljoin(self.base, href)
            parsed = urlparse(full_url)

            # Only internal links (same domain)
            if parsed.netloc == self.parsed_base.netloc or not parsed.netloc:
                clean = f"{parsed.scheme}://{parsed.netloc}{parsed.path}"
                clean = clean.rstrip('/')
                self.links.add(clean)
                self.current_text = ''

                if self.in_nav:
                    self.nav_links.append({'url': clean, 'text': ''})
                elif self.in_footer:
                    self.footer_links.append({'url': clean, 'text': ''})

    def handle_data(self, data):
        text = data.strip()
        if text:
            if self.in_nav and self.nav_links:
                self.nav_links[-1]['text'] = text
            elif self.in_footer and self.footer_links:
                self.footer_links[-1]['text'] = text

    def handle_endtag(self, tag):
        if tag == 'nav':
            self.in_nav = False
        if tag == 'footer':
            self.in_footer = False

def discover(html_content, base_url):
    extractor = LinkExtractor(base_url)
    extractor.feed(html_content)

    # Deduplicate nav links
    seen = set()
    nav = []
    for item in extractor.nav_links:
        if item['url'] not in seen and item['text']:
            nav.append(item)
            seen.add(item['url'])

    seen_footer = set()
    footer = []
    for item in extractor.footer_links:
        if item['url'] not in seen_footer and item['text']:
            footer.append(item)
            seen_footer.add(item['url'])

    return {
        'all_pages': sorted(list(extractor.links)),
        'navigation': nav,
        'footer_links': footer,
        'total_internal_pages': len(extractor.links)
    }

if __name__ == '__main__':
    import sys
    url = sys.argv[1]
    with open('/home/claude/site-analysis/pages/index.html', 'r', errors='ignore') as f:
        html = f.read()

    result = discover(html, url)

    with open('/home/claude/site-analysis/pages-discovered.json', 'w') as f:
        json.dump(result, f, indent=2)

    print(f"=== PAGES DISCOVERED: {result['total_internal_pages']} ===")
    print("\nNavigation:")
    for item in result['navigation']:
        print(f"  - {item['text']}: {item['url']}")
    print(f"\nAll pages: {len(result['all_pages'])}")
```

### STEP 3: Fetch Each Page via web_fetch

After discovering pages, use `web_fetch` tool to fetch EACH internal page.
Save each to `/home/claude/site-analysis/pages/{page-name}.html`

For each page, Claude should:
- Note the page URL
- Read the full HTML structure
- Identify unique components on that page

### STEP 4: Analyze HTML Structure Per Page

```python
#!/usr/bin/env python3
"""analyze_structure.py — Deep HTML structure analysis for each page"""
import re
import json
import os
from html.parser import HTMLParser

class StructureAnalyzer(HTMLParser):
    def __init__(self):
        super().__init__()
        self.structure = []
        self.tag_stack = []
        self.components = []
        self.images = []
        self.videos = []
        self.iframes = []
        self.forms = []
        self.buttons = []
        self.headings = []
        self.meta = {}
        self.current_text = ''

    def handle_starttag(self, tag, attrs):
        attrs_d = dict(attrs)
        self.tag_stack.append(tag)

        # Meta tags
        if tag == 'meta':
            name = attrs_d.get('name', attrs_d.get('property', ''))
            content = attrs_d.get('content', '')
            if name and content:
                self.meta[name] = content[:200]

        if tag == 'title':
            self.current_text = ''

        # Semantic sections = components
        if tag in ['section', 'header', 'footer', 'main', 'aside', 'article', 'nav']:
            self.components.append({
                'tag': tag,
                'class': attrs_d.get('class', ''),
                'id': attrs_d.get('id', ''),
                'data_attrs': {k: v for k, v in attrs_d.items() if k.startswith('data-')},
                'depth': len(self.tag_stack)
            })

        # Divs with meaningful classes
        if tag == 'div':
            cls = attrs_d.get('class', '')
            if cls and any(keyword in cls.lower() for keyword in [
                'hero', 'banner', 'slider', 'carousel', 'gallery', 'grid',
                'card', 'feature', 'testimonial', 'pricing', 'cta', 'footer',
                'header', 'nav', 'menu', 'modal', 'popup', 'sidebar',
                'container', 'wrapper', 'section', 'block', 'row', 'col'
            ]):
                self.components.append({
                    'tag': 'div',
                    'class': cls,
                    'id': attrs_d.get('id', ''),
                    'depth': len(self.tag_stack)
                })

        # Images
        if tag == 'img':
            src = attrs_d.get('src', attrs_d.get('data-src', ''))
            self.images.append({
                'src': src,
                'alt': attrs_d.get('alt', ''),
                'width': attrs_d.get('width', ''),
                'height': attrs_d.get('height', ''),
                'loading': attrs_d.get('loading', '')
            })

        # Videos
        if tag == 'video':
            self.videos.append({
                'src': attrs_d.get('src', ''),
                'poster': attrs_d.get('poster', ''),
                'autoplay': 'autoplay' in attrs_d,
                'loop': 'loop' in attrs_d
            })

        # Iframes (maps, embeds)
        if tag == 'iframe':
            self.iframes.append({
                'src': attrs_d.get('src', ''),
                'title': attrs_d.get('title', ''),
                'width': attrs_d.get('width', ''),
                'height': attrs_d.get('height', '')
            })

        # Forms
        if tag == 'form':
            self.forms.append({
                'action': attrs_d.get('action', ''),
                'method': attrs_d.get('method', ''),
                'class': attrs_d.get('class', '')
            })

        # Buttons & CTAs
        if tag == 'button' or (tag == 'a' and 'btn' in attrs_d.get('class', '').lower()):
            self.buttons.append({
                'tag': tag,
                'class': attrs_d.get('class', ''),
                'href': attrs_d.get('href', ''),
                'text': ''
            })

        # Headings
        if tag in ['h1', 'h2', 'h3', 'h4', 'h5', 'h6']:
            self.current_text = ''

    def handle_data(self, data):
        text = data.strip()
        if text:
            self.current_text = text

            if self.tag_stack and self.tag_stack[-1] in ['h1','h2','h3','h4','h5','h6']:
                self.headings.append({
                    'level': self.tag_stack[-1],
                    'text': text[:150]
                })

            if self.buttons and self.tag_stack:
                self.buttons[-1]['text'] = text[:50]

            if self.tag_stack and self.tag_stack[-1] == 'title':
                self.meta['title'] = text

    def handle_endtag(self, tag):
        if self.tag_stack and self.tag_stack[-1] == tag:
            self.tag_stack.pop()

def analyze_page(html_content, page_name):
    analyzer = StructureAnalyzer()
    analyzer.feed(html_content)

    return {
        'page': page_name,
        'title': analyzer.meta.get('title', ''),
        'meta': analyzer.meta,
        'components': analyzer.components[:50],
        'headings': analyzer.headings,
        'images': analyzer.images[:30],
        'videos': analyzer.videos,
        'iframes': analyzer.iframes,
        'forms': analyzer.forms,
        'buttons': [b for b in analyzer.buttons if b.get('text')][:20]
    }

if __name__ == '__main__':
    pages_dir = '/home/claude/site-analysis/pages'
    all_analysis = {}

    for f in sorted(os.listdir(pages_dir)):
        if f.endswith('.html'):
            with open(os.path.join(pages_dir, f), 'r', errors='ignore') as fh:
                html = fh.read()
            page_name = f.replace('.html', '')
            all_analysis[page_name] = analyze_page(html, page_name)
            print(f"Analyzed: {page_name} — {len(all_analysis[page_name]['components'])} components")

    with open('/home/claude/site-analysis/structure-analysis.json', 'w') as f:
        json.dump(all_analysis, f, indent=2)
```

### STEP 5: Extract CSS Styles & Design Tokens

```python
#!/usr/bin/env python3
"""extract_styles.py — Extract CSS variables, colors, spacing, breakpoints"""
import re
import json
import os

def extract_from_html(html):
    result = {
        'css_variables': {},
        'colors': set(),
        'font_sizes': set(),
        'spacing': set(),
        'border_radius': set(),
        'shadows': [],
        'breakpoints': set(),
        'transitions': set(),
        'animations': [],
        'gradients': [],
        'external_css': [],
        'external_js': []
    }

    # CSS custom properties (variables)
    vars_found = re.findall(r'--([a-zA-Z0-9-]+)\s*:\s*([^;}{]+)', html)
    for name, value in vars_found:
        result['css_variables'][f'--{name}'] = value.strip()

    # Colors (hex, rgb, hsl)
    hex_colors = re.findall(r'#(?:[0-9a-fA-F]{3}){1,2}\b', html)
    result['colors'].update(hex_colors)

    rgb_colors = re.findall(r'rgba?\([^)]+\)', html)
    result['colors'].update(rgb_colors)

    hsl_colors = re.findall(r'hsla?\([^)]+\)', html)
    result['colors'].update(hsl_colors)

    # Font sizes
    sizes = re.findall(r'font-size:\s*([^;}{]+)', html)
    result['font_sizes'].update(s.strip() for s in sizes)

    # Spacing (padding/margin)
    paddings = re.findall(r'(?:padding|margin)(?:-(?:top|right|bottom|left))?:\s*([^;}{]+)', html)
    result['spacing'].update(p.strip() for p in paddings[:30])

    # Border radius
    radii = re.findall(r'border-radius:\s*([^;}{]+)', html)
    result['border_radius'].update(r.strip() for r in radii)

    # Box shadows
    shadows = re.findall(r'box-shadow:\s*([^;}{]+)', html)
    result['shadows'] = list(set(s.strip() for s in shadows))[:10]

    # Media queries = breakpoints
    breakpoints = re.findall(r'@media[^{]*\(\s*(?:min|max)-width:\s*(\d+)px', html)
    result['breakpoints'].update(breakpoints)

    # Transitions
    transitions = re.findall(r'transition:\s*([^;}{]+)', html)
    result['transitions'].update(t.strip() for t in transitions)

    # Keyframe animations
    keyframes = re.findall(r'@keyframes\s+([a-zA-Z0-9_-]+)', html)
    result['animations'] = list(set(keyframes))

    # Gradients
    grads = re.findall(r'(?:linear|radial|conic)-gradient\([^)]+\)', html)
    result['gradients'] = list(set(grads))[:10]

    # External stylesheets
    css_links = re.findall(r'<link[^>]+href=["\']([^"\']+\.css[^"\']*)', html)
    result['external_css'] = css_links

    # External scripts
    js_links = re.findall(r'<script[^>]+src=["\']([^"\']+)["\']', html)
    result['external_js'] = js_links

    # Convert sets to lists for JSON
    for key in result:
        if isinstance(result[key], set):
            result[key] = sorted(list(result[key]))

    return result

if __name__ == '__main__':
    pages_dir = '/home/claude/site-analysis/pages'
    combined = {
        'css_variables': {},
        'colors': set(),
        'font_sizes': set(),
        'spacing': set(),
        'border_radius': set(),
        'shadows': [],
        'breakpoints': set(),
        'transitions': set(),
        'animations': [],
        'gradients': [],
        'external_css': [],
        'external_js': []
    }

    for f in os.listdir(pages_dir):
        if f.endswith('.html'):
            with open(os.path.join(pages_dir, f), 'r', errors='ignore') as fh:
                result = extract_from_html(fh.read())

            combined['css_variables'].update(result['css_variables'])
            combined['colors'].update(result['colors'])
            combined['font_sizes'].update(result['font_sizes'])
            combined['spacing'].update(result['spacing'])
            combined['border_radius'].update(result['border_radius'])
            combined['shadows'].extend(result['shadows'])
            combined['breakpoints'].update(result['breakpoints'])
            combined['transitions'].update(result['transitions'])
            combined['animations'].extend(result['animations'])
            combined['gradients'].extend(result['gradients'])
            combined['external_css'].extend(result['external_css'])
            combined['external_js'].extend(result['external_js'])

    # Convert sets
    for key in combined:
        if isinstance(combined[key], set):
            combined[key] = sorted(list(combined[key]))
    combined['shadows'] = list(set(combined['shadows']))[:10]
    combined['external_css'] = list(set(combined['external_css']))
    combined['external_js'] = list(set(combined['external_js']))

    with open('/home/claude/site-analysis/css-extracted/design-tokens.json', 'w') as f:
        json.dump(combined, f, indent=2)

    print(f"=== DESIGN TOKENS ===")
    print(f"  CSS Variables: {len(combined['css_variables'])}")
    print(f"  Colors: {len(combined['colors'])}")
    print(f"  Breakpoints: {combined['breakpoints']}")
    print(f"  Animations: {len(combined['animations'])}")
```

### STEP 6: Detect Technologies & Third-Party Services

```python
#!/usr/bin/env python3
"""detect_tech.py — Identify CMS, frameworks, analytics, and services"""
import re
import json

def detect(html):
    tech = {
        'cms': None,
        'css_framework': None,
        'js_framework': None,
        'analytics': [],
        'fonts_service': None,
        'cdn': [],
        'services': [],
        'ecommerce': None,
        'icons': None
    }

    # CMS Detection
    if 'wp-content' in html or 'wp-includes' in html:
        tech['cms'] = 'WordPress'
    elif 'sites/default/files' in html:
        tech['cms'] = 'Drupal'
    elif '/templates/' in html and 'Joomla' in html:
        tech['cms'] = 'Joomla'
    elif 'Shopify' in html or 'cdn.shopify' in html:
        tech['cms'] = 'Shopify'
    elif 'squarespace' in html.lower():
        tech['cms'] = 'Squarespace'
    elif 'wixsite' in html or 'wix.com' in html:
        tech['cms'] = 'Wix'
    elif 'webflow' in html.lower():
        tech['cms'] = 'Webflow'

    # CSS Frameworks
    if 'bootstrap' in html.lower():
        tech['css_framework'] = 'Bootstrap'
    elif 'tailwind' in html.lower() or re.search(r'class="[^"]*(?:flex|grid|p-\d|m-\d|text-)', html):
        tech['css_framework'] = 'Tailwind CSS (possible)'
    elif 'foundation' in html.lower():
        tech['css_framework'] = 'Foundation'
    elif 'bulma' in html.lower():
        tech['css_framework'] = 'Bulma'

    # JS Frameworks
    if 'react' in html.lower() or '__NEXT_DATA__' in html or '_next/' in html:
        tech['js_framework'] = 'React / Next.js'
    elif 'vue' in html.lower() or '__vue__' in html:
        tech['js_framework'] = 'Vue.js'
    elif 'angular' in html.lower() or 'ng-' in html:
        tech['js_framework'] = 'Angular'
    elif 'svelte' in html.lower():
        tech['js_framework'] = 'Svelte'
    elif 'nuxt' in html.lower():
        tech['js_framework'] = 'Nuxt.js (Vue)'
    elif 'gatsby' in html.lower():
        tech['js_framework'] = 'Gatsby (React)'
    elif 'astro' in html.lower():
        tech['js_framework'] = 'Astro'

    # Analytics
    if 'google-analytics' in html or 'gtag(' in html or 'GA_TRACKING' in html:
        tech['analytics'].append('Google Analytics')
    if 'googletagmanager' in html:
        tech['analytics'].append('Google Tag Manager')
    if 'hotjar' in html.lower():
        tech['analytics'].append('Hotjar')
    if 'mixpanel' in html.lower():
        tech['analytics'].append('Mixpanel')
    if 'segment' in html.lower():
        tech['analytics'].append('Segment')
    if 'fbq(' in html or 'facebook.net' in html:
        tech['analytics'].append('Facebook Pixel')

    # Font service
    if 'fonts.googleapis.com' in html:
        tech['fonts_service'] = 'Google Fonts'
    elif 'use.typekit.net' in html:
        tech['fonts_service'] = 'Adobe Fonts (Typekit)'
    elif 'fonts.shopify.com' in html:
        tech['fonts_service'] = 'Shopify Fonts'

    # CDN
    cdns = re.findall(r'(?:https?:)?//([a-z0-9.-]+cdn[a-z0-9.-]+)', html)
    tech['cdn'] = list(set(cdns))[:5]

    # E-commerce
    if 'shopify' in html.lower():
        tech['ecommerce'] = 'Shopify'
    elif 'woocommerce' in html.lower():
        tech['ecommerce'] = 'WooCommerce'
    elif 'bigcommerce' in html.lower():
        tech['ecommerce'] = 'BigCommerce'
    elif 'magento' in html.lower():
        tech['ecommerce'] = 'Magento'

    # Icons
    if 'font-awesome' in html.lower() or 'fa-' in html:
        tech['icons'] = 'Font Awesome'
    elif 'material-icons' in html.lower():
        tech['icons'] = 'Material Icons'
    elif 'lucide' in html.lower():
        tech['icons'] = 'Lucide Icons'
    elif 'heroicons' in html.lower():
        tech['icons'] = 'Heroicons'
    elif 'feather' in html.lower():
        tech['icons'] = 'Feather Icons'

    # Additional services
    if 'maps.googleapis' in html or 'maps.google' in html:
        tech['services'].append('Google Maps')
    if 'recaptcha' in html.lower():
        tech['services'].append('reCAPTCHA')
    if 'stripe' in html.lower():
        tech['services'].append('Stripe')
    if 'intercom' in html.lower():
        tech['services'].append('Intercom')
    if 'crisp' in html.lower():
        tech['services'].append('Crisp Chat')
    if 'tawk' in html.lower():
        tech['services'].append('Tawk.to')
    if 'cookieconsent' in html.lower() or 'cookie' in html.lower():
        tech['services'].append('Cookie Consent')

    return tech

if __name__ == '__main__':
    with open('/home/claude/site-analysis/pages/index.html', 'r', errors='ignore') as f:
        html = f.read()

    tech = detect(html)

    with open('/home/claude/site-analysis/technology-stack.json', 'w') as f:
        json.dump(tech, f, indent=2)

    print("=== TECHNOLOGY STACK ===")
    for key, val in tech.items():
        if val:
            print(f"  {key}: {val}")
```

### STEP 7: Generate Complete Website Blueprint

```python
#!/usr/bin/env python3
"""generate_blueprint.py — Create the final comprehensive analysis document"""
import json
import os

def load(path):
    try:
        with open(path) as f: return json.load(f)
    except: return {}

pages = load('/home/claude/site-analysis/pages-discovered.json')
structure = load('/home/claude/site-analysis/structure-analysis.json')
tokens = load('/home/claude/site-analysis/css-extracted/design-tokens.json')
tech = load('/home/claude/site-analysis/technology-stack.json')

md = """# Website Analysis Blueprint

## 🎯 Overview

This document contains everything needed to understand and recreate this website.

---

## 🛠 Technology Stack

"""

for key, val in tech.items():
    if val:
        if isinstance(val, list):
            md += f"- **{key.replace('_', ' ').title()}**: {', '.join(val)}\n"
        else:
            md += f"- **{key.replace('_', ' ').title()}**: {val}\n"

md += """
---

## 🧭 Site Map & Navigation

### Primary Navigation
"""

for item in pages.get('navigation', []):
    md += f"- [{item['text']}]({item['url']})\n"

md += f"\n### All Discovered Pages ({pages.get('total_internal_pages', 0)})\n"
for url in pages.get('all_pages', [])[:30]:
    md += f"- {url}\n"

md += """
---

## 🎨 Design Tokens (CSS)

### CSS Custom Properties
```css
:root {
"""

for var, val in list(tokens.get('css_variables', {}).items())[:30]:
    md += f"  {var}: {val};\n"

md += "}\n```\n"

md += "\n### Colors Used\n"
for color in tokens.get('colors', [])[:20]:
    md += f"- `{color}`\n"

md += "\n### Font Sizes\n"
for size in sorted(tokens.get('font_sizes', []))[:15]:
    md += f"- `{size}`\n"

md += f"\n### Border Radius Values\n"
for br in tokens.get('border_radius', [])[:10]:
    md += f"- `{br}`\n"

md += f"\n### Breakpoints\n"
for bp in sorted(tokens.get('breakpoints', [])):
    md += f"- `{bp}px`\n"

md += f"\n### Box Shadows\n"
for shadow in tokens.get('shadows', [])[:5]:
    md += f"- `{shadow[:80]}...`\n"

md += f"\n### Animations\n"
for anim in tokens.get('animations', [])[:10]:
    md += f"- `@keyframes {anim}`\n"

md += """
---

## 📄 Page-by-Page Analysis

"""

for page_name, analysis in structure.items():
    md += f"### Page: {page_name}\n"
    md += f"**Title**: {analysis.get('title', 'N/A')}\n\n"

    if analysis.get('headings'):
        md += "**Content Structure:**\n"
        for h in analysis['headings'][:15]:
            level = int(h['level'][1])
            md += f"{'  ' * (level-1)}- **{h['level'].upper()}**: {h['text']}\n"

    if analysis.get('components'):
        md += "\n**Components/Sections:**\n"
        for comp in analysis['components'][:20]:
            cls = comp.get('class', '')[:60]
            md += f"- `<{comp['tag']}>` .{cls}\n"

    if analysis.get('images'):
        md += f"\n**Images**: {len(analysis['images'])} found\n"

    if analysis.get('forms'):
        md += f"\n**Forms**: {len(analysis['forms'])} found\n"
        for form in analysis['forms']:
            md += f"  - action=`{form.get('action', '')}` method=`{form.get('method', '')}`\n"

    if analysis.get('buttons'):
        md += "\n**Buttons/CTAs:**\n"
        for btn in analysis['buttons'][:10]:
            md += f"  - \"{btn.get('text', '')}\" (class: {btn.get('class', '')[:40]})\n"

    md += "\n---\n\n"

md += """
## 🔗 External Dependencies

### CSS Files
"""

for css in tokens.get('external_css', [])[:15]:
    md += f"- `{css}`\n"

md += "\n### JavaScript Files\n"
for js in tokens.get('external_js', [])[:15]:
    md += f"- `{js}`\n"

md += """
---

## 📋 Recreation Checklist

Use this checklist when building the clone:

- [ ] Set up project with correct technology stack
- [ ] Import fonts (Google Fonts / Adobe Fonts)
- [ ] Create CSS variables from design tokens
- [ ] Build navigation matching discovered menu items
- [ ] Create each page listed in site map
- [ ] Implement responsive breakpoints
- [ ] Add animations/transitions detected
- [ ] Match color palette exactly
- [ ] Implement forms with correct fields
- [ ] Add third-party integrations (maps, analytics, chat)
- [ ] Test on mobile, tablet, desktop
- [ ] Match all CTA buttons text and placement

---

## 📎 Files in This Package

```
site-analysis/
├── pages/                      # Raw HTML of each page
│   ├── index.html
│   └── ...
├── css-extracted/
│   └── design-tokens.json      # Colors, fonts, spacing, breakpoints
├── pages-discovered.json       # All URLs and navigation
├── structure-analysis.json     # Per-page component breakdown
├── technology-stack.json       # CMS, framework, analytics detection
└── WEBSITE-BLUEPRINT.md        # This document
```
"""

with open('/home/claude/site-analysis/WEBSITE-BLUEPRINT.md', 'w') as f:
    f.write(md)

print("Blueprint saved to WEBSITE-BLUEPRINT.md")
```

---

## EXECUTION ORDER

When user provides a URL, follow this exact sequence:

1. **`web_fetch` the main URL** → save as `pages/index.html`
2. **Run `discover_pages.py`** → find all internal pages
3. **`web_fetch` each discovered page** (max 10-15 pages) → save to `pages/`
4. **Run `analyze_structure.py`** → per-page component analysis
5. **Run `extract_styles.py`** → extract design tokens
6. **Run `detect_tech.py`** → identify technology stack
7. **Run `generate_blueprint.py`** → create the final document
8. **Package and present** → zip everything for the user

```bash
cd /home/claude/site-analysis
zip -r /mnt/user-data/outputs/website-analysis.zip \
  pages/ css-extracted/ screenshots/ \
  pages-discovered.json structure-analysis.json \
  technology-stack.json WEBSITE-BLUEPRINT.md
```

---

## WHAT CLAUDE SHOULD DO ADDITIONALLY (beyond scripts)

After running the automated analysis, Claude should manually:

### Visual Analysis (Claude reads HTML and notes)
1. **Identify the design style** — match to one of skills 01-24 (e.g., "This site uses Dark Mode Elegance style similar to skill 15")
2. **Note the layout pattern** — single column, sidebar, bento grid, full-width sections
3. **Describe the visual hierarchy** — what draws attention first, second, third
4. **Color scheme classification** — monochromatic, complementary, analogous, triadic
5. **Spacing system** — tight (8px), standard (16px), airy (32px+)

### Component Inventory
For each unique component found, note:
- What skill could generate it (e.g., "Hero uses Oversized Typography from skill 20")
- Whether it needs custom CSS or matches an existing pattern
- Interactive behavior (hover effects, animations, scroll triggers)

### Responsive Strategy
- Mobile-first or desktop-first?
- What changes at each breakpoint?
- Is the mobile nav hamburger or tab-based?
- Do grids change column count?

### Content Inventory
- How many pages?
- What types of content (text, images, video, forms)?
- Is there a blog/news section?
- Is there e-commerce (product pages, cart, checkout)?
- Multi-language support?

---

## OUTPUT TO USER

After analysis, Claude should present:
1. **The ZIP package** with all files
2. **A summary** of key findings:
   - Technology stack
   - Number of pages
   - Design style identified
   - Key components list
   - Recommended skills to use for recreation
3. **A recreation plan** — step-by-step how to build the site using available skills

---

## IMPORTANT NOTES

- `web_fetch` is the primary tool for fetching pages (NOT curl, unless web_fetch fails)
- Maximum 15 pages to fetch (prioritize main nav pages)
- For very large sites, focus on unique page templates, not every individual page
- Always save raw HTML — it's the most valuable reference
- If site blocks scraping, inform user and suggest alternative approaches
- Respect robots.txt and copyright — this is for learning and reference only
- Some SPAs (React/Vue) may have minimal HTML — note this in analysis
