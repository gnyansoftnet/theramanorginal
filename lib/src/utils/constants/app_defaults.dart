import 'package:flutter/material.dart';

class AppDefaults {
  AppDefaults._();
  static const double radius = 10;
  static const double margin = 15;
  static const double padding = 15;
  static const double horizentalPadding = 15;
  static const double verticalPadding = 10;

  /// Used For Border Radius
  static BorderRadius borderRadius = BorderRadius.circular(radius);

  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.04),
    ),
  ];
}
