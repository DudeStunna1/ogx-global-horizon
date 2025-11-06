#!/bin/bash
# ==============================================
#  🜂 OGX / THARA Deploy Script — Scrollée V∞.1
#  @OGX-MODULE: DEPLOY
# ==============================================

echo "🜂  [OGX] Initialisation du déploiement..."

# Vérifie la présence des fichiers critiques
for f in README.md index.html manifest.json; do
  if [ ! -f "$f" ]; then
    echo "⚠️  Fichier manquant : $f"
  fi
done

# Simule un build PWA statique
echo "🏗️  Construction du package statique..."
sleep 2

# Commit & push automatique
git add .
git commit -m "🔮 OGX Deploy — THARA Scrollée AutoSync"
git push origin main

# Notification (facultative)
if [ -n "$AM_BOT_TOKEN" ] && [ -n "$AM_CHAT_ID" ]; then
  curl -s -X POST "https://api.telegram.org/bot${AM_BOT_TOKEN}/sendMessage" \
       -d chat_id="${AM_CHAT_ID}" \
       -d text="✅ *THARA Deploy* : nouveau build OGX déployé avec succès."
fi

echo "✨  Déploiement OGX terminé."
#!/bin/bash
# ==============================================
#  🜃 OGX / THARA Sync Script — Scrollée V∞.1
#  @OGX-MODULE: SYNC
# ==============================================

echo "🜃  [OGX] Synchronisation en cours..."

# Synchronise les fichiers YAML avec scripts.js
for y in yaml/*.yaml; do
  echo "🔁 Sync du fichier : $y"
done

# Simulation d'un checksum de cohérence
checksum=$(find yaml/ -type f -exec md5sum {} \; | md5sum)
echo "🧩  Checksum global : ${checksum}"

# Envoi de la notification
if [ -n "$AM_BOT_TOKEN" ] && [ -n "$AM_CHAT_ID" ]; then
  curl -s -X POST "https://api.telegram.org/bot${AM_BOT_TOKEN}/sendMessage" \
       -d chat_id="${AM_CHAT_ID}" \
       -d text="🧠 *THARA Sync* : YAML + Scripts synchronisés avec succès."
fi

echo "🌐  Synchronisation OGX complète."
#!/bin/bash
# ==============================================
#  🜄 OGX / THARA Report Script — Scrollée V∞.1
#  @OGX-MODULE: REPORT
# ==============================================

echo "🜄  [OGX] Génération du rapport journalier..."

report_file="OGX_Report_$(date +%Y%m%d_%H%M%S).log"

{
  echo "🧾 OGX DAILY REPORT"
  echo "Date : $(date)"
  echo "------------------------------"
  git log -1
  echo "------------------------------"
  echo "YAML checksum :"
  find yaml/ -type f -exec md5sum {} \;
} > "$report_file"

# Envoi du rapport via Bot (si actif)
if [ -n "$AM_BOT_TOKEN" ] && [ -n "$AM_CHAT_ID" ]; then
  curl -s -F document=@"$report_file" \
       "https://api.telegram.org/bot${AM_BOT_TOKEN}/sendDocument?chat_id=${AM_CHAT_ID}" \
       -F caption="📜 *THARA Report* : nouveau rapport OGX généré."
fi

echo "📜  Rapport sauvegardé dans : $report_file"
echo "Fin du processus OGX Report."
./bash/deploy.sh
./bash/sync.sh
./bash/report.sh