'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "d1578d0bf91889a8950c96cdb9f4b472",
"version.json": "bad9bee4bb6ae00156096825cf5b18fd",
"splash/img/light-2x.png": "8d6f81a61471025e25aaa7b2887d4781",
"splash/img/dark-4x.png": "1081432f5762dba8455f7b082b05aba6",
"splash/img/light-3x.png": "041113dad741190b47d5ab50ed25883c",
"splash/img/dark-3x.png": "041113dad741190b47d5ab50ed25883c",
"splash/img/light-4x.png": "1081432f5762dba8455f7b082b05aba6",
"splash/img/dark-2x.png": "8d6f81a61471025e25aaa7b2887d4781",
"splash/img/dark-1x.png": "ea9a90be3027a1acf1d976016adf11ff",
"splash/img/light-1x.png": "ea9a90be3027a1acf1d976016adf11ff",
"index.html": "66b16d0d6e4fb9796b778d0f111754bf",
"/": "66b16d0d6e4fb9796b778d0f111754bf",
"main.dart.js": "8fc468b52c1d99a3ba75c9621f6a85f8",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "d4b0a6e0d65d6807db595f41e607f493",
"icons/Icon-192.png": "6d882bb5caa452f32d605f1808e20cfb",
"icons/Icon-maskable-192.png": "6d882bb5caa452f32d605f1808e20cfb",
"icons/Icon-maskable-512.png": "f4a72622ab88b078bbbe82efe8e7ed53",
"icons/Icon-512.png": "f4a72622ab88b078bbbe82efe8e7ed53",
"manifest.json": "5c2e8ac2f7b1bc22b582c8397eaf3c40",
"assets/AssetManifest.json": "9c8e8f3ac7e815a4f22352b754232b86",
"assets/NOTICES": "ce59ae438088a6e11dcbf2b89ff6d228",
"assets/FontManifest.json": "c20910ffd2d92ca1824487e35afe2b21",
"assets/AssetManifest.bin.json": "d28d41a3cdcdb9ac2f464f6bacd1cca3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "9803b10fdb0372021a50fda3d96240e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "3b3085ea41d2b8a90a1e99c902382cef",
"assets/fonts/MaterialIcons-Regular.otf": "e0eb83ca999efc6aec249d0744ff108b",
"assets/assets/imgs/botbusters_logo.png": "3942a08e5ca68cbefb529f2574994793",
"assets/assets/imgs/prepatec_garzasada_logo.png": "852eb5aecee14a84cbb920ad1bbaa3e0",
"assets/assets/imgs/field.png": "0da9fe18574c5fd5909367fe80651a49",
"assets/assets/imgs/substations.png": "55de5b41ea405844ba79df801987cf33",
"assets/assets/imgs/reefscape.png": "ecb72ce534fb730578e9a8a823de78b7",
"assets/assets/imgs/coral.png": "72c834e59aea7949275c410cabf3d6ac",
"assets/assets/svgs/climb/deep.svg": "63b97990950a6e873a136399f24000df",
"assets/assets/svgs/climb/shallow.svg": "0bbf09841c7e8d12e5a69f2026fc6eb4",
"assets/assets/svgs/notesPickup/both.svg": "87da83e86c46b98c75057bade407c036",
"assets/assets/svgs/notesPickup/source.svg": "7ee1a61ee022f8ea4b89e5a93f3f0a8c",
"assets/assets/svgs/notesPickup/floor.svg": "5cd57383a01297ff61da57ba6d563a53",
"assets/assets/svgs/x.svg": "b0b5c97bb29b03fa7029fb90bffd43e1",
"assets/assets/svgs/finalStatus/parked.svg": "a25d023cdffa7222898f258b32219c0a",
"assets/assets/svgs/finalStatus/failed.svg": "272da62ec53e012a54946454b9c936ed",
"assets/assets/svgs/finalStatus/docked.svg": "cc1f5db84ab00c770e348dce3bb86218",
"assets/assets/svgs/finalStatus/engaged.svg": "fec61ac95137ccc6947f4295c832fc8b",
"assets/assets/svgs/driverSkill/veryEff.svg": "7461f68a8e124921a1ed97cfa91f8f7c",
"assets/assets/svgs/driverSkill/eff.svg": "7cd92d4b02a4fc12a8fb050fb893fa66",
"assets/assets/svgs/driverSkill/notEff.svg": "bb0305d95ed131831028101c9315175a",
"assets/assets/svgs/spotlights.svg": "5eb6a8b5e599cfc0087a770c7bdfb4fc",
"assets/assets/svgs/floorPickup/cubes.svg": "d3f1c76f9cf42ae87b1076540cc72616",
"assets/assets/svgs/floorPickup/cones.svg": "21d7232dc30c1d06ba4053ec54c1e674",
"assets/assets/svgs/floorPickup/both.svg": "52745cec3bfc2eec9cb50a2cc25bf2f0",
"assets/assets/fonts/IBM_Plex_Mono/IBMPlexMono-Bold.ttf": "be4cc57a744421b843e08a2001436f40",
"assets/assets/fonts/IBM_Plex_Mono/IBMPlexMono-Medium.ttf": "3594148d0a094b10fc8e21ae7aaef7d9",
"assets/assets/fonts/IBM_Plex_Mono/IBMPlexMono-Regular.ttf": "ea96a0afddbe8ff439be465b16cbd381",
"assets/assets/fonts/IBM_Plex_Mono/IBMPlexMono-SemiBold.ttf": "892b0e616e4dd0381b579d848d98bcbc",
"assets/assets/fonts/Inter/Inter-Medium.ttf": "ed533866b5c83114c7dddbcbc2288b19",
"assets/assets/fonts/Inter/Inter-Bold.ttf": "275bfea5dc74c33f51916fee80feae67",
"assets/assets/fonts/Inter/Inter-Regular.ttf": "079af0e2936ccb99b391ddc0bbb73dcb",
"assets/assets/fonts/Inter/Inter-ExtraBold.ttf": "c9709fb8e32755490795ce5bd226c3a0",
"assets/assets/fonts/Inter/Inter-Black.ttf": "980c7e8757e741bb49c7c96513924c61",
"assets/assets/fonts/Inter/Inter-SemiBold.ttf": "07a48beb92b401297a76ff9f6aedd0ed",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
