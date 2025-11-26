@echo off
echo Building optimized Flutter web app...
flutter build web --release --web-renderer canvaskit --dart-define=FLUTTER_WEB_USE_SKIA=true --source-maps
echo Build complete!
