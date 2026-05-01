'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "22e6377d81d69b15775946cca46e6dfe",
"assets/AssetManifest.bin.json": "7ec57552ab42cf339231747823c82f3b",
"assets/AssetManifest.json": "c2d46b612f82e518706e7838a9fbacae",
"assets/assets/images/c1.webp": "71255b03d52210ff4414bbbb6fe5f6ae",
"assets/assets/images/c2.webp": "7a3f2ade41161426035699e5aed7118b",
"assets/assets/images/d1.jpg": "062c35064217ecf449db386c93dc55fd",
"assets/assets/images/d2.webp": "ede461e5ebdcb473241e3c29adbba498",
"assets/assets/images/d3.jpg": "ab5e44cd031a1c3b5f702434cadfdd46",
"assets/assets/images/e1.webp": "5c3357e262156d66cdda8a6ac43eb2b8",
"assets/assets/images/e2.webp": "3e676db2a4cc0087966878fce56f7774",
"assets/assets/images/e3.webp": "fd6e99d4314714c3801fed29561370e4",
"assets/assets/images/e4.webp": "780ee7a7dae0bac4b93552365f32d282",
"assets/assets/images/e5.webp": "2dc9c0ffcc74b43551141e5da1d20f76",
"assets/assets/images/e6.webp": "542f88d28b95e92e9dbbfc0725ef4492",
"assets/assets/images/icon.webp": "59b733ddd507de9f97f8a91e71fd8257",
"assets/assets/images/m1.webp": "b831d9656c838197ad172196bb6e2781",
"assets/assets/images/m2.webp": "c194870bc426a0d8292732c1679af10d",
"assets/assets/images/m3.webp": "8d68c0593aefc80dbea27bf8921fbabf",
"assets/assets/images/profile.webp": "32112ce3df489ce60788cc1e39ea2e78",
"assets/assets/images/w1.webp": "c5aaf6703ebda8c34039c0c226ded25c",
"assets/assets/images/w10.webp": "23feebf33f65f44f3f9ca645a9446818",
"assets/assets/images/w2.webp": "b5746b61ccce7d35afbae58f3bbcc527",
"assets/assets/images/w3.webp": "dd26e2b395a9bdc9efc9c74ade603e62",
"assets/assets/images/w4.webp": "9c4c7164c319c0ecedf0f3bb5def98a7",
"assets/assets/images/w5.webp": "e041e0e61b0236a69cd350c81dfdc7de",
"assets/assets/images/w6.webp": "ae87cc6bb08943119cd0ed8382823e9f",
"assets/assets/images/w7.webp": "038dcda32097f1bc747cee0d0cde3c49",
"assets/assets/images/w8.webp": "ae55e944f8072aa70eb7f5a29d20bf64",
"assets/assets/images/w9.webp": "b3973a8af0c41fee22baa01ac2d0411d",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "1f49b05a2c2aada23cee68e2dbb360c9",
"assets/NOTICES": "d309e1abe5f417c54f69641a2e995d73",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "2dea6a14df78a2d3afe473b36e523e0a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "262525e2081311609d1fdab966c82bfc",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "269f971cec0d5dc864fe9ae080b19e23",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5e556df40929cf7e29153ab6c4e9160b",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "35ca56deef1e46c50fa6545357874feb",
"icons/Icon-192.png": "0675b7f89534c8b3ec328323fd8eaa8a",
"icons/Icon-512.png": "d489299261ef684f26561a09533c0849",
"icons/Icon-maskable-192.png": "0675b7f89534c8b3ec328323fd8eaa8a",
"icons/Icon-maskable-512.png": "d489299261ef684f26561a09533c0849",
"index.html": "8435d4c5c7cd6ce60f43e60a376fab33",
"/": "8435d4c5c7cd6ce60f43e60a376fab33",
"main.dart.js": "710452f143cf7ea4aeef683ac92295a9",
"manifest.json": "214aa9bdc7633f1917fe43788acaebed",
"version.json": "7367c9ca1c69727a8bb09a7d2d21d48c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
