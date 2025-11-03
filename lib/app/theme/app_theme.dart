import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../design/design_tokens.dart';

class AppTheme {
  final ThemeData light;
  final ThemeData dark;
  final ThemeMode mode;
  const AppTheme({required this.light, required this.dark, this.mode = ThemeMode.system});
}

final appThemeProvider = Provider<AppTheme>((ref) {
  const scheme = FlexSchemeColor(
    primary: AppColors.primary,
    primaryContainer: Color(0xFF4CAF50),
    secondary: AppColors.secondary,
    secondaryContainer: Color(0xFF26A69A),
    tertiary: Color(0xFF388E3C),
    tertiaryContainer: Color(0xFFA5D6A7),
    appBarColor: AppColors.primary,
  );
  final light = FlexThemeData.light(
    colors: scheme,
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarStyle: FlexAppBarStyle.primary,
  );
  final dark = FlexThemeData.dark(
    colors: scheme,
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarStyle: FlexAppBarStyle.primary,
  );
  return AppTheme(light: light, dark: dark, mode: ThemeMode.system);
});
