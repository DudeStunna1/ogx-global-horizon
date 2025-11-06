// △ OGX Main Script — Scrollée V∞.5
console.log("⚙️ THARA Booting...");

async function OGX_Report() {
  const res = await fetch("/bash/report.sh");
  console.log("📡 Report triggered", res.status);
}

window.addEventListener("load", () => {
  console.log("🌐 OGX Online");
  setInterval(OGX_Report, 86400000); // every 24h
});