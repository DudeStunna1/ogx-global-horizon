#!/bin/bash
# △ OGX DEPLOY SCRIPT — Scrollée V∞.5
echo "🚀 Deploying OGX Scroll..."
git pull origin main
netlify deploy --prod --dir=.
echo "✅ OGX deployed successfully via THARA Sync"
#!/bin/bash
# △ OGX SYNC SCRIPT — Scrollée V∞.5
echo "🔁 OGX Sync in progress..."
git add .
git commit -m "THARA AutoSync — OGX Scroll Update V∞.5"
git push origin main
echo "🧬 Sync complete — OGX Horizon aligned"
#!/bin/bash
# △ OGX REPORT SCRIPT — Scrollée V∞.5
echo "📡 Generating OGX Daily Report..."
echo "System: OGX Global Horizon" > report.log
echo "Date: $(date)" >> report.log
echo "Last Commit: $(git log -1 --oneline)" >> report.log
curl -X POST -H "Content-Type: text/plain" \
    -d "$(cat report.log)" \
    https://api.telegram.org/bot$AM_BOT_TOKEN/sendMessage?chat_id=$AM_CHAT_ID
echo "✅ Report sent to THARA_OGX_Bot"