'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "559bbe8b80eed0bf40b38fd27aece7db",
"assets/AssetManifest.bin.json": "647217100d1f2d85d07b1fc385654164",
"assets/AssetManifest.json": "5bd74c252f5dd6dd8ed2263df7242978",
"assets/assets/fonts/Inter/Inter-Bold.ttf": "ba74cc325d5f67d0efbeda51616352db",
"assets/assets/fonts/Inter/Inter-Regular.ttf": "ea5879884a95551632e9eb1bba5b2128",
"assets/assets/fonts/Raleway/Raleway-Bold.ttf": "9aefa157ae4a8f7ff923dd88cee3917f",
"assets/assets/fonts/Raleway/Raleway-ExtraBold.ttf": "4e37fffb940ad5e5b9b96f59079e2014",
"assets/assets/icons/app_store.svg": "48cc1dadf5c9e81644785e9df35d0d36",
"assets/assets/icons/clickup.svg": "922842fe38046c4dfd8bf3667e1209f3",
"assets/assets/icons/dart.svg": "42b7d6baab799d5bbff21a4be8449c4d",
"assets/assets/icons/doc.svg": "32b6bb937b8703a23463867f2f3806d0",
"assets/assets/icons/figma.svg": "703d791125db04051218e90c182e3179",
"assets/assets/icons/firebase.svg": "1707e40ed1e6440229ffef896e993b73",
"assets/assets/icons/flutter.svg": "2cd26549438d3b57fbb9275a6fc915fd",
"assets/assets/icons/git.svg": "5c902d5b1a76fefee32ef9268b6049e8",
"assets/assets/icons/github.svg": "cc86812b84fe00a1d9f5b1b5aa67f87e",
"assets/assets/icons/github_octo.svg": "95b28328a1f8538eee7e40f7c1e38391",
"assets/assets/icons/g_drive.svg": "31754f0c9aebcc8e367ed8efdda4e925",
"assets/assets/icons/g_maps.svg": "a1e488bf4daf0e394d60ddbecfd06e01",
"assets/assets/icons/linkedin.svg": "3d64ab92c593ffbf177ac3b30e84e147",
"assets/assets/icons/logo_strokes.svg": "1abf793088b10c7a7663f56a98e97c07",
"assets/assets/icons/m_azure.svg": "5e2a16230e77af381ebce51b3e2fecd9",
"assets/assets/icons/onesignal.svg": "d735c5b7d281b34d5424645d8bbea77f",
"assets/assets/icons/play_store.svg": "fcfbb1a30d75c7ae74e135d308729cee",
"assets/assets/icons/postman.svg": "330b1a1323c5081892e8d96e8f605dcc",
"assets/assets/icons/supabase.svg": "2d7ed4298053877c421a5bd13abbab9d",
"assets/assets/images/pfp.jpg": "596e192b2c970181d571c2bc66480cc7",
"assets/assets/translations/ar.json": "d58a391de61da113e6fa75d51378f2e3",
"assets/assets/translations/en.json": "2effe8ecbfd286f04c5eca04bc6c3b3b",
"assets/FontManifest.json": "66b5d29d1152c0ea5c13f5faab755314",
"assets/fonts/MaterialIcons-Regular.otf": "78038ab0a54715ffdceeef3bc41b40aa",
"assets/NOTICES": "b6b8da6bb9dbc2b7b654793811c39704",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "5673b7ba6c65c8e8a641dd48f8a02885",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "85912891adad36481b714e7a9d53ada9",
"/": "85912891adad36481b714e7a9d53ada9",
"main.dart.js": "57142a9564f2629fd20f3648e45091d0",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
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
