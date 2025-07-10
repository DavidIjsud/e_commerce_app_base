import 'package:e_commerce_app_base/themes/colors/palmyrasoft_theme_colors.dart';
import 'package:e_commerce_app_base/themes/style/palmyra_button_style.dart';
import 'package:e_commerce_app_base/themes/typography/palmyrasoft_typography.dart';
import 'package:flutter/material.dart';

class PalmyraSoftTheme {
  late PalmyrasoftThemeColors colors;
  late PalmyrasoftTypography typography;
  late PalmyraButtonStyle buttonStyle;
  late WidgetsConfig widgetsConfig;

  static final PalmyraSoftTheme _instance = PalmyraSoftTheme.internal();

  PalmyraSoftTheme.internal();

  factory PalmyraSoftTheme({PalmyrasoftThemeColors colors = const PalmyrasoftThemeColors()}) {}
}

class WidgetsConfig {
  final double inputBorderRadius;
  final EdgeInsets inputLabelPadding;

  WidgetsConfig({this.inputBorderRadius = 8.0, this.inputLabelPadding = const EdgeInsets.symmetric(horizontal: 8.0)});
}
