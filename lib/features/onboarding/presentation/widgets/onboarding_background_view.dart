import 'package:flutter/material.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/models/models.dart';

/// Background view widget for onboarding screens
///
/// This widget displays the background image with a gradient overlay.
/// It's used in the onboarding carousel to show different background images.
class OnboardingBackgroundView extends StatelessWidget {
  final OnboardingPageData page;

  const OnboardingBackgroundView({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(page.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.3)],
          ),
        ),
      ),
    );
  }
}
