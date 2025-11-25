import 'package:e_commerce_app_base/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/models/models.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/widgets/onboarding_carousel.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;

    // Sample onboarding pages using config assets and localized strings
    final onboardingPages = [
      OnboardingPageData(
        title: l10n.onboarding_page_one_title,
        description: l10n.onboarding_page_one_description,
        backgroundImage: config.assets.onboarding1,
      ),
      OnboardingPageData(
        title: l10n.onboarding_page_two_title,
        description: l10n.onboarding_page_two_description,
        backgroundImage: config.assets.onboarding2,
      ),
      OnboardingPageData(
        title: l10n.onboarding_page_three_title,
        description: l10n.onboarding_page_three_description,
        backgroundImage: config.assets.onboarding3,
      ),
    ];

    return Scaffold(
      body: OnboardingCarousel(
        pages: onboardingPages,
        onSkip: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        onComplete: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
      ),
    );
  }
}
