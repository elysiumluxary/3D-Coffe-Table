<!doctype html>
<html lang="tr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>3D Coffee Table — AR Viewer</title>
  <meta name="description" content="Basit model-viewer tabanlı AR viewer. base.glb dosyasını kullanır." />
  <style>
    html,body { height:100%; margin:0; font-family: system-ui, -apple-system, Roboto, "Helvetica Neue", Arial; background:#111; color:#fff; display:flex; align-items:center; justify-content:center; }
    .container { max-width:960px; width:100%; padding:16px; box-sizing:border-box; }
    model-viewer { width:100%; height:70vh; background:linear-gradient(180deg,#222,#111); border-radius:12px; display:block; }
    .controls { margin-top:12px; display:flex; gap:8px; flex-wrap:wrap; }
    a.button { background:#1a73e8; color:white; padding:8px 12px; border-radius:8px; text-decoration:none; }
    .note { margin-top:8px; color:#ccc; font-size:0.9rem; }
  </style>
  <!-- model-viewer CDN -->
  <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>
</head>
<body>
  <div class="container">
    <h1>3D Coffee Table — AR Viewer</h1>

    <model-viewer
      src="base.glb"
      ios-src="base.usdz"
      alt="3D Coffee Table"
      ar
      ar-modes="webxr scene-viewer quick-look"
      environment-image="neutral"
      auto-rotate
      camera-controls
      shadow-intensity="1"
      exposure="1"
    ></model-viewer>

    <div class="controls">
      <a class="button" href="base.glb" download>GLB İndir</a>
      <a class="button" href="base.usdz" download>USDZ İndir (varsa)</a>
      <a class="button" id="open-ar" href="#">AR'ı Aç</a>
    </div>

    <div class="note">
      Not: Android (Scene Viewer) çoğu cihazda çalışır. iOS için Quick Look USDZ gerektirir.
    </div>
  </div>

  <script>
    const mv = document.querySelector('model-viewer');
    document.getElementById('open-ar').addEventListener('click', (e) => {
      e.preventDefault();
      if (mv && mv.enterAR) {
        mv.enterAR().catch((err)=> {
          console.warn('AR başlatılamadı:', err);
          alert('AR başlatılamadı. Tarayıcı/cihaz AR desteklemeyebilir veya model bulunamıyor olabilir.');
        });
      } else {
        alert('Tarayıcınız model-viewer enterAR() fonksiyonunu desteklemiyor.');
      }
    });
  </script>
</body>
</html>
