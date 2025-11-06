// ============================================================
// 🜂 OGX Scripts — YAML Loader + Bot Sync
// ============================================================

// Utilitaire: lecture YAML (nécessite js-yaml ou raw parse)
async function loadYAML(path) {
  try {
    const response = await fetch(path);
    const text = await response.text();
    if (window.jsyaml) {
      return jsyaml.load(text);
    } else {
      console.warn("js-yaml not found; returning raw text");
      return text;
    }
  } catch (err) {
    console.error("❌ OGX YAML Load Error:", err);
    return null;
  }
}

// OGX Main Loader
async function initOGX() {
  console.log("🜂 Loading OGX_Total_Pack_V∞.yaml...");
  const config = await loadYAML("./OGX_YAML/OGX_Total_Pack_V∞.yaml");

  if (!config) {
    console.error("No OGX config found.");
    return;
  }

  // Affiche le nom et version
  console.log(`✅ OGX Config Loaded: ${config.meta.name} (${config.meta.version})`);
  
  // Envoie une notification au bot (THARA_OGX_Bot)
  if (config.foundries && config.foundries.linked_agents.includes("THARA_OGX_Bot")) {
    sendBotUpdate("THARA_OGX_Bot", `OGX ${config.meta.version} ready and synced.`);
  }

  // Synchronise les mirror hours
  if (config.mirror && config.mirror.trigger_hours) {
    scheduleMirrors(config.mirror.trigger_hours);
  }
}

// Fonction: notifier le bot OGX
function sendBotUpdate(botName, message) {
  console.log(`🤖 Sending update to ${botName}: ${message}`);
  // ici, tu pourrais intégrer un webhook privé si tu veux automatiser les pings
}

// Fonction: planification miroir (console log seulement)
function scheduleMirrors(hours) {
  console.log("⏱ OGX Mirror Sync Hours:");
  hours.forEach(h => console.log(`→ ${h}`));
}

// Auto-lancement
window.addEventListener("load", initOGX);
Add netlify.toml + scripts.js — Activate OGX Auto Deploy & Mirror Sync V∞.2