#!/bin/bash
# Deploy website to FTP with folder structure

SITE_NAME=$1
SITE_PATH=$2
SITE_TITLE=$3
SITE_DESC=$4
SITE_EMOJI=$5

if [ -z "$SITE_NAME" ] || [ -z "$SITE_PATH" ]; then
    echo "Usage: ./deploy-website.sh <site-name> <path> [title] [desc] [emoji]"
    echo ""
    echo "Example:"
    echo "  ./deploy-website.sh luxury-spa /root/clawd/sites/luxury-spa \"Luxury Spa\" \"Premium spa website\" \"🧖\""
    exit 1
fi

# FTP credentials
FTP_HOST="altas.serveriai.lt"
FTP_USER="afread@godeliauskas.com"
FTP_PASS="i0-0-asdsdsad852(s/./;"
FTP_DIR="/domains/alfred.godeliauskas.com/public_html"

echo "📦 Deploying $SITE_NAME to FTP..."
echo "📁 Source: $SITE_PATH"
echo "🌐 Target: $FTP_DIR/$SITE_NAME"
echo ""

# Check if source path exists
if [ ! -d "$SITE_PATH" ]; then
    echo "❌ Error: Path $SITE_PATH does not exist"
    exit 1
fi

# Upload to FTP
lftp -u $FTP_USER,$FTP_PASS $FTP_HOST <<EOF
cd $FTP_DIR
mkdir -p $SITE_NAME
cd $SITE_NAME
lcd $SITE_PATH
mirror -R --delete --verbose .
bye
EOF

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully deployed to FTP!"
    echo "🌐 Live at: https://alfred.godeliauskas.com/$SITE_NAME/"
    echo ""
    
    if [ ! -z "$SITE_TITLE" ]; then
        echo "⚠️  Next step: Update /index.html portfolio with:"
        echo "   • Title: $SITE_TITLE"
        echo "   • Description: $SITE_DESC"
        echo "   • Emoji: $SITE_EMOJI"
        echo "   • URL: /$SITE_NAME/"
    fi
else
    echo ""
    echo "❌ Deployment failed!"
    exit 1
fi
