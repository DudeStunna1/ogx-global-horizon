#!/bin/bash
echo "🚀 OGX DEPLOYMENT STARTED..."
npm run build || echo "⚠️ Build skipped (no npm project)"
git add .
git commit -m "OGX AutoDeploy — THARA ScrollSync v∞.5"
git push origin main
echo "✅ Deployment pushed to Netlify"
#!/bin/bash
echo "🔄 OGX SYNC STARTED..."
git pull origin main
node scripts.js sync
echo "✅ OGX Synchronized with THARA_OGX_Bot"
#!/bin/bash
echo "🧠 Generating OGX Sync Report..."
node ogx-bot.js report
echo "📤 Report sent to THARA_OGX_Bot ✅"
#!/bin/bash
echo "🎧 OGX BEAT POST INITIALIZED..."
node scripts.js post
echo "✅ Beats published across OGX Social Channels"