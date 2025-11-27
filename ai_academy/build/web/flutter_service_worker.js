'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "c3f59ae9f666e4fe0054b7af0aa4c663",
"assets/AssetManifest.bin.json": "ae698fc4004640b8602c879f8444e8da",
"assets/AssetManifest.json": "7767b80d187b4d2a158365c686767e6f",
"assets/assets/icon/Amazon.png": "d673ca70d7dbd4fa58eb9b54de503031",
"assets/assets/icon/chatgpt.png": "4b2b0f91bb455deaeaca76886bc37e57",
"assets/assets/icon/education.png": "ea37b2cc501efc1a7043ef21151f1d13",
"assets/assets/icon/Facebook.png": "81109ff6ae414f480088bd34a4332fb7",
"assets/assets/icon/Gemini.png": "ee19e9a3c780819c58af6df06f4af981",
"assets/assets/icon/generative.png": "73a4d755a946e7347071e6dbd8f96844",
"assets/assets/icon/google.png": "60957d7ff58c6efcbe7296d33c64aa4c",
"assets/assets/icon/GoogleCloud.png": "efe2942ceb84cfcddfbdab2a5fd823e5",
"assets/assets/icon/Instagram.png": "5bbeaf9b262ea3935d13adb47afd10ae",
"assets/assets/icon/knowledge.png": "1b54ae62416fc4930b2caeced1045e84",
"assets/assets/icon/LinkedIn.png": "e1e200f58921d4c89704c207747c7f5b",
"assets/assets/icon/logo.png": "d7ad600589da39f388b1ed6a78c3a701",
"assets/assets/icon/microsoft.png": "1efcef22de5aa1c28d15147f48a2b195",
"assets/assets/icon/practical.png": "a3ba534e8c9915de5417f7c0ed417517",
"assets/assets/icon/Shutterstock.png": "0c4176294a402527225886c8922c4f95",
"assets/assets/icon/X.png": "e2a775cbe5fa0f05f9532f1957277846",
"assets/assets/icon/YouTube.png": "ea6bbc1ef78d85dc257792971acd4c90",
"assets/assets/images/about.png": "1ade632490b26c79ac8f136545cd0646",
"assets/assets/images/aboutthis.png": "3205e4543bc7c0144e385fe5c31cf2b7",
"assets/assets/images/Career.png": "5fcbedce8325bbca979cebbc300b2ea1",
"assets/assets/images/coursebanner.png": "41da69f7657e25283370ebfa1a1218f1",
"assets/assets/images/events.png": "252e51287a28b0f490195f0bd65698ad",
"assets/assets/images/events2.png": "f99a4ce552bc1b77f9fab76a6e2eccca",
"assets/assets/images/Frame1.png": "bad94eac90dd0f6a4fc3abf12e1b02dd",
"assets/assets/images/Frame2.png": "66f28ed71a5637760f70d850a76b3970",
"assets/assets/images/Frame3.png": "d43cf3a317fd149da06ce1ed068a8570",
"assets/assets/images/Frame4.png": "f9c009470f0bff90911ceebf66617ea7",
"assets/assets/images/Frame5.png": "7d37e8cb781837fa16651b0e2d0ae116",
"assets/assets/images/Frame6.png": "dee3e50409cf08dfd7e4310303d51ac0",
"assets/assets/images/Frame7.png": "adfec7b0d02a0bd6af0b1e3c1b3ece90",
"assets/assets/images/Frame8.png": "da95e66c00cfa53833fbd6a14f7b9043",
"assets/assets/images/Guide.png": "9ce5f4d5c6ac596d24d404f85ccdce1a",
"assets/assets/images/home_baner.png": "571ed97c50235aa38c9624024c2cab3b",
"assets/assets/images/im1.png": "2ebb354ceb1aa14cecefebd35b9a537b",
"assets/assets/images/im2.png": "ead16db15f4e21b98cd3bdf4731fd0da",
"assets/assets/images/im3.png": "46a9694cd0d1c9d8d1da952fe7cc00a0",
"assets/assets/images/Learning.png": "25686cb37713bcecfa8af01aa64a2207",
"assets/assets/images/pic1.png": "1d943de15234a9645125c1d2df8d9065",
"assets/assets/images/pic2.png": "d18e58a8b94b70ed8975d74e2246bfa7",
"assets/assets/images/pic3.png": "04ea01b228958e777fa7404ab6b2dff7",
"assets/assets/images/pic4.png": "6fdf284a0997510012bd69805d208684",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2d15325600c688b33ebacf0095d8dd1f",
"assets/NOTICES": "80670e6f4fcf0b531bb7ff8eb4fa1cae",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"deploy%20ai_academy.zip": "368af891c9ee60312c2388930f4019c5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "ab418bdb319d380a941d13cc8df412f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "3efaa287ba592621346424d973d36c55",
"/": "3efaa287ba592621346424d973d36c55",
"main.dart.js": "3708629900e742d4bb0be158c4902f57",
"manifest.json": "72cb5521adb29961838e10ec8eff9ca0",
"version.json": "bef238d923c293bd327e89277156859d"};
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
