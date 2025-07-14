import 'package:e_commerce_app_base/themes/colors/palmyrasoft_theme_colors.dart';
import 'package:e_commerce_app_base/themes/style/palmyra_button_style.dart';
import 'package:e_commerce_app_base/themes/typography/ecommerce_typography.dart';
import 'package:e_commerce_app_base/themes/typography/palmyrasoft_typography.dart';
import 'package:flutter/material.dart';

class PalmyraSoftTheme {
  late PalmyrasoftThemeColors colors;
  late PalmyrasoftTypography typography;
  late PalmyraButtonStyle buttonStyle;
  late WidgetsConfig widgetsConfig;

  static final PalmyraSoftTheme _instance = PalmyraSoftTheme.internal();

  PalmyraSoftTheme.internal();

  factory PalmyraSoftTheme({
    PalmyrasoftThemeColors colors = const PalmyrasoftThemeColorsDefault(),
    PalmyrasoftTypography typography = const EcommerceTypography(),
    PalmyraButtonStyle buttonStyle = const PalmyraButtonStyleDefault(),
    WidgetsConfig widgetsConfig = const WidgetsConfig(),
  }) {
    final theme = _instance;
    theme.colors = colors;
    theme.typography = typography;
    theme.buttonStyle = buttonStyle;
    theme.widgetsConfig = widgetsConfig;
    return theme;
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
