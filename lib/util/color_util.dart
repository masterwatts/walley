import 'package:flutter/material.dart';

class ColorUtil {
  static Color getSeedColor() => const Color.fromARGB(255, 62, 156, 53);
  static ColorScheme getColorScheme() =>
      ColorScheme.fromSeed(seedColor: getSeedColor());
}
