import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// Reusable text form field widget following the app's design system
///
/// This field maintains the base design (rounded corners, border colors, padding)
/// while allowing customization of label, hint, validation, and other properties.
///
/// Example usage:
/// ```dart
/// AppTextFormField(
///   label: 'Email',
///   hintText: 'Enter your email',
///   onChanged: (value) => handleEmailChange(value),
///   keyboardType: TextInputType.emailAddress,
/// )
/// ```
class AppTextFormField extends StatelessWidget {
  /// Creates an app text form field
  ///
  /// [label] optional label text displayed above the field
  /// [hintText] placeholder text inside the field
  /// [initialValue] initial text value
  /// [onChanged] callback when text changes
  /// [obscureText] hides text (for passwords)
  /// [keyboardType] keyboard type (email, number, etc.)
  /// [textInputAction] action button on keyboard
  /// [suffixIcon] optional icon button on the right side
  /// [prefixIcon] optional icon on the left side
  /// [validator] optional validation function
  /// [enabled] whether the field is enabled
  /// [maxLines] maximum lines (default: 1)
  /// [readOnly] whether the field is read-only
  /// [controller] optional text editing controller
  /// [focusNode] optional focus node
  /// [onSubmitted] callback when user submits (presses done/enter)
  const AppTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.initialValue,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.enabled = true,
    this.maxLines = 1,
    this.readOnly = false,
    this.controller,
    this.focusNode,
    this.onSubmitted,
  });

  final String? label;
  final String? hintText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final int? maxLines;
  final bool readOnly;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    final field = TextFormField(
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      enabled: enabled,
      maxLines: maxLines,
      readOnly: readOnly,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: colors.neutral60),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.neutral40),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.neutral40),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.primaryHoverIris, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.neutral40),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.errorMainRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.errorMainRed, width: 2),
        ),
        filled: true,
        fillColor: enabled ? Colors.white : colors.neutral20,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );

    // If label is provided, wrap field with label
    if (label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            style: typography.bodyMediumMedium.copyWith(
              color: colors.neutral100,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          field,
        ],
      );
    }

    return field;
  }
}
