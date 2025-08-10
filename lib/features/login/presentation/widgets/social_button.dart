import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// Individual social button widget
class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const SocialButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: colors.neutral40, width: 1),
        ),
        child: Center(child: child),
      ),
    );
  }
}
