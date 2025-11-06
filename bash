# Donne la permission d’exécution aux scripts bash
chmod +x bash/deploy.sh
chmod +x bash/sync.sh
chmod +x bash/report.sh

# Commit et push pour déclencher le rebuild
git add .
git commit -m "OGX Fix — Bash exec permissions & full sync"
git push origin main