// △ OGX Service Worker — Scrollée V∞.5
self.addEventListener("install", () => console.log("⚙️ THARA SW Installed"));
self.addEventListener("activate", () => console.log("🌐 OGX Activated"));
self.addEventListener("fetch", e => {
  e.respondWith(fetch(e.request).catch(() => caches.match(e.request)));
});