#!/bin/bash
# UI QA Test for Seed to Cup V2
# Tests all pages at 3 breakpoints (375px, 768px, 1920px)

SITE_URL="https://alfred.godeliauskas.com/seed-to-cup-v2"
TIMESTAMP=$(date +%Y-%m-%d-%H%M)
REPORT_FILE="/root/clawd/reports/ui-qa-seed-to-cup-$TIMESTAMP.md"

echo "🔍 Starting UI QA Test for Seed to Cup V2..."
echo "Report will be saved to: $REPORT_FILE"

# Test pages
PAGES=(
    "$SITE_URL/index.html|Homepage"
    "$SITE_URL/pages/collection.html|Collection"
    "$SITE_URL/pages/product.html|Product"
    "$SITE_URL/pages/story.html|Story"
    "$SITE_URL/pages/brewing-guide.html|Brewing Guide"
    "$SITE_URL/pages/contact.html|Contact"
)

# Breakpoints
BREAKPOINTS=(
    "375x812|Mobile (iPhone SE)"
    "768x1024|Tablet (iPad)"
    "1920x1080|Desktop (Full HD)"
)

# Create report header
cat > "$REPORT_FILE" << EOF
# UI QA Report - Seed to Cup V2
**Date:** $(date +'%Y-%m-%d %H:%M UTC')  
**Site:** $SITE_URL  
**Agent:** UI QA Agent v1.0

---

## Summary
- **Pages Tested:** ${#PAGES[@]}
- **Breakpoints:** ${#BREAKPOINTS[@]} (375px, 768px, 1920px)
- **Total Tests:** $((${#PAGES[@]} * ${#BREAKPOINTS[@]}))

---

## Test Results

EOF

echo "Testing ${#PAGES[@]} pages at ${#BREAKPOINTS[@]} breakpoints..."

# Note: Actual browser testing requires browser tool invocation
# This script generates the report structure
# Browser testing done via Clawdbot's browser tool

for page_entry in "${PAGES[@]}"; do
    IFS='|' read -r url name <<< "$page_entry"
    echo "### 📄 $name" >> "$REPORT_FILE"
    echo "**URL:** $url" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    
    for bp_entry in "${BREAKPOINTS[@]}"; do
        IFS='|' read -r size desc <<< "$bp_entry"
        echo "- **$desc ($size):** 🔍 Test pending..." >> "$REPORT_FILE"
    done
    
    echo "" >> "$REPORT_FILE"
done

cat >> "$REPORT_FILE" << EOF

---

## Next Steps

⚠️ **Browser testing required via Clawdbot browser tool**

Run the following commands to complete testing:

\`\`\`bash
# Example browser test invocation
# (Actual testing done via agent with browser access)

for PAGE in index.html pages/*.html; do
    for WIDTH in 375 768 1920; do
        # Test page at breakpoint
        # Check: horizontal scroll, padding, menu, console errors
        # Screenshot + log issues
    done
done
\`\`\`

---

**Report Status:** Structure Generated ✅  
**Browser Tests:** Pending (requires agent invocation)  
**Final Report:** Will be updated after browser testing completes
EOF

echo "✅ Report structure created: $REPORT_FILE"
echo ""
echo "📋 Next: Run browser-based tests via UI QA Agent"
echo "   Use: Agent reads /root/clawd/agents/ui-qa-agent.md"
echo "   Tests each page with browser tool"
echo "   Updates report with results"

cat "$REPORT_FILE"
