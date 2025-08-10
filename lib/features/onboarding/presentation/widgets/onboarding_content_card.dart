import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_states.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

class OnboardingContentCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onSkip;
  final VoidCallback? onNext;

  const OnboardingContentCard({
    super.key,
    required this.title,
    required this.description,
    this.onSkip,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    // Get the injected config for theme and assets
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: colors.primaryHoverIris,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text(
            title,
            style: typography.heading3Bold.copyWith(
              color: Colors.white,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Description
          Text(
            description,
            style: typography.bodyLargeRegular.copyWith(
              color: Colors.white,
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Page indicators
          BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              if (state.isActive || state.isLoading) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.totalPages,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: index == state.currentPageIndex ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: index == state.currentPageIndex
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 32),

          // Navigation buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Skip button
              TextButton(
                onPressed: onSkip,
                child: Text(
                  l10n.onboarding_skip_button,
                  style: typography.bodyMediumMedium.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              // Next button
              BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  if (state.isActive || state.isLoading) {
                    return GestureDetector(
                      onTap: onNext,
                      child: Row(
                        children: [
                          Text(
                            state.isLastPage
                                ? l10n.onboarding_get_started_button
                                : l10n.onboarding_next_button,
                            style: typography.bodyMediumMedium.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          if (!state.isLastPage) ...[
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
