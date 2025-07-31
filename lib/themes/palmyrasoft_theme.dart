import 'package:e_commerce_app_base/themes/colors/palmyrasoft_theme_colors.dart';
import 'package:e_commerce_app_base/themes/style/palmyra_button_style.dart';
import 'package:e_commerce_app_base/themes/typography/ecommerce_typography.dart';
import 'package:e_commerce_app_base/themes/typography/palmyrasoft_typography.dart';
import 'package:flutter/material.dart';

class PalmyraSoftTheme {
  late PalmyrasoftThemeColors themeColors;
  late PalmyrasoftTypography typography;
  late PalmyraButtonStyle buttonStyle;
  late WidgetsConfig widgetsConfig;

  static final PalmyraSoftTheme _instance = PalmyraSoftTheme.internal();

  PalmyraSoftTheme.internal();

  factory PalmyraSoftTheme({
    PalmyrasoftThemeColors themeColors = const PalmyrasoftThemeColorsDefault(),
    PalmyrasoftTypography typography = const EcommerceTypography(),
    PalmyraButtonStyle buttonStyle = const PalmyraButtonStyleDefault(),
    WidgetsConfig widgetsConfig = const WidgetsConfig(),
  }) {
    final theme = _instance;
    theme.themeColors = themeColors;
    theme.typography = typography;
    theme.buttonStyle = buttonStyle;
    theme.widgetsConfig = widgetsConfig;
    return theme;
  }

  ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: themeColors.primaryHoverIris,
        primary: themeColors.primaryHoverIris,
        secondary: themeColors.secondaryMainYellow,
        error: themeColors.errorMainRed,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: themeColors.neutral100),
        bodyLarge: TextStyle(color: themeColors.neutral100),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle.buttonStyle()),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.fromLTRB(30, 16, 16, 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: themeColors.neutral40, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: themeColors.neutral40, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}

class WidgetsConfig {
  final double inputBorderRadius;
  final EdgeInsets inputLabelPadding;

  const WidgetsConfig({
    this.inputBorderRadius = 8.0,
    this.inputLabelPadding = const EdgeInsets.symmetric(horizontal: 8.0),
  });
}
