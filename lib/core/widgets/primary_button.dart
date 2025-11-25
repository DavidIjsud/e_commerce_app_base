import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// Primary button widget following the app's design system
///
/// This button maintains the base design (primary color, rounded corners, loading state)
/// while allowing customization of text, size, and optional color overrides.
///
/// Example usage:
/// ```dart
/// PrimaryButton(
///   text: 'Sign In',
///   onPressed: () => handleLogin(),
///   isLoading: false,
/// )
/// ```
class PrimaryButton extends StatelessWidget {
  /// Creates a primary button
  ///
  /// [text] is required and displays the button label
  /// [onPressed] callback when button is tapped (null disables the button)
  /// [isLoading] shows a loading indicator when true
  /// [width] button width (default: double.infinity for full width)
  /// [height] button height (default: 56)
  /// [backgroundColor] optional override for background color (default: primaryHoverIris)
  /// [textColor] optional override for text color (default: Colors.white)
  /// [fontSize] optional override for text font size (default: 16)
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 56,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 16,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? colors.primaryHoverIris,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? Colors.white,
                  ),
                ),
              )
            : Text(
                text,
                style: typography.bodyLargeMedium.copyWith(
                  color: textColor ?? Colors.white,
                  fontSize: fontSize,
                ),
              ),
      ),
    );
  }
}

