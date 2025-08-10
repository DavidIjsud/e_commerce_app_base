import 'package:flutter/material.dart';

/// Individual social button widget
class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const SocialButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(child: child),
      ),
    );
  }
}
