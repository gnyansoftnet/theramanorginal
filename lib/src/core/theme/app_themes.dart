import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

///This class defines light theme and dark theme
///Here we used flex color scheme
class AppThemes {
  static ThemeData get lightTheme => FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff1145a4),
          primaryContainer: Color(0xffacc7f6),
          secondary: Color(0xffb61d1d),
          secondaryContainer: Color(0xffec9f9f),
          tertiary: Color(0xff376bca),
          tertiaryContainer: Color(0xffcfdbf2),
          appBarColor: Color(0xffcfdbf2),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: false,
      );
}
