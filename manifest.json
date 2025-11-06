// △ OGX Main Script — Scrollée V∞.4
self.addEventListener("install", () => console.log("⚙️ THARA Install Complete"));
self.addEventListener("activate", () => console.log("🌐 OGX Activated"));

async function OGX_Report() {
  const res = await fetch("/bash/report.sh");
  console.log("📡 Report triggered", res.status);
}
setInterval(OGX_Report, 86400000); // Daily