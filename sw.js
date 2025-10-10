self.addEventListener('install', function(e){self.skipWaiting();});
self.addEventListener('activate', function(e){console.log('OGX SW activated');});
self.addEventListener('fetch', function(e){});
