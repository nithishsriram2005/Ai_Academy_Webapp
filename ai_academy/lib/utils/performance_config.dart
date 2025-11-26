import 'package:flutter/material.dart';

class PerformanceConfig {
  static void optimizeApp() {
    PaintingBinding.instance.imageCache.maximumSize = 100;
    PaintingBinding.instance.imageCache.maximumSizeBytes = 50 << 20;
  }
}
