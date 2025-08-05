import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/models/models.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/widgets/onboarding_carousel.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// Onboarding Page
///
/// This page displays the onboarding carousel with multiple screens.
///
/// To use this page:
/// 1. Add the required images to assets/images/ directory
/// 2. Update the onboardingPages list with your content
/// 3. Implement proper navigation in _navigateToMainApp method
/// 4. Add this page to your app's routing system
///
/// Example usage in main.dart or routing:
/// ```dart
/// MaterialApp(
///   home: OnboardingPage(),
/// )
/// ```
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.injector<OnboardingBloc>(),
      child: const _OnboardingPageView(),
    );
  }
}

class _OnboardingPageView extends StatelessWidget {
  const _OnboardingPageView();

  @override
  Widget build(BuildContext context) {
    // Get the injected config
    final config = Get.injector<Config>();

    // Sample onboarding pages using config assets
    final onboardingPages = [
      OnboardingPageData(
        title: "We serve incomparable delicacies",
        description:
            "All the best restaurants with their top menu waiting for you, they can't wait for your order!!",
        backgroundImage: config.assets.onboarding1,
      ),
      OnboardingPageData(
        title: "Fast & Reliable Delivery",
        description:
            "Get your favorite food delivered to your doorstep in minutes with our lightning-fast delivery service.",
        backgroundImage: config.assets.onboarding2,
      ),
      OnboardingPageData(
        title: "Track Your Order",
        description:
            "Follow your order in real-time and know exactly when your delicious meal will arrive.",
        backgroundImage: config.assets.onboarding3,
      ),
    ];

    return Scaffold(
      body: OnboardingCarousel(
        pages: onboardingPages,
        onSkip: () {
          // Navigate to main app or login screen
          _navigateToMainApp(context);
        },
        onComplete: () {
          // Navigate to main app or login screen
          _navigateToMainApp(context);
        },
      ),
    );
  }

  void _navigateToMainApp(BuildContext context) {
    // TODO: Navigate to main app or login screen
    // For now, just show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Welcome to the app!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
