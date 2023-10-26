import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

///This class defines light theme and dark theme
///Here we used flex color scheme
class AppThemes {
  static ThemeData get lightTheme => FlexThemeData.light(
        colors: const FlexSchemeColor(
            primary: Color(0xff004881),
            primaryContainer: Color(0xffd0e4ff),
            secondary: Color(0xffac3306),
            secondaryContainer: Color(0xffffdbcf),
            tertiary: Color(0xff006875),
            tertiaryContainer: Color(0xff95f0ff),
            appBarColor: Color(0xffffdbcf),
            error: Colors.red),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        appBarElevation: 1,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.inter().fontFamily,
      );
  static ThemeData get darkTheme => FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff9fc9ff),
          primaryContainer: Color(0xff00325b),
          secondary: Color(0xffffb59d),
          secondaryContainer: Color(0xff872100),
          tertiary: Color(0xff86d2e1),
          tertiaryContainer: Color(0xff004e59),
          appBarColor: Color(0xff872100),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        appBarElevation: 1,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.robotoSerif().fontFamily,
      );
}
