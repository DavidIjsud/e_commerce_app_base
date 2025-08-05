import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_events.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/models/models.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/widgets/onboarding_content_card.dart';

/// Carousel widget for onboarding screens
class OnboardingCarousel extends StatefulWidget {
  final List<OnboardingPageData> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onNext;
  final VoidCallback? onComplete;

  const OnboardingCarousel({
    super.key,
    required this.pages,
    this.onSkip,
    this.onNext,
    this.onComplete,
  });

  @override
  State<OnboardingCarousel> createState() => _OnboardingCarouselState();
}

class _OnboardingCarouselState extends State<OnboardingCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Initialize the bloc with the first page
    context.read<OnboardingBloc>().add(OnboardingPageChanged(0));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int pageIndex) {
    context.read<OnboardingBloc>().add(OnboardingPageChanged(pageIndex));
  }

  void _onSkip() {
    widget.onSkip?.call();
  }

  void _onNext() {
    final bloc = context.read<OnboardingBloc>();
    final state = bloc.state;

    if (state.isActive || state.isLoading) {
      if (state.isLastPage) {
        widget.onComplete?.call();
      } else {
        bloc.add(OnboardingNextPressed());
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView for the carousel
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.pages.length,
            itemBuilder: (context, index) {
              final page = widget.pages[index];
              return _OnboardingPageView(
                page: page,
                onSkip: _onSkip,
                onNext: _onNext,
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Individual page view widget
class _OnboardingPageView extends StatelessWidget {
  final OnboardingPageData page;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const _OnboardingPageView({
    required this.page,
    required this.onSkip,
    required this.onNext,
  });

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
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              OnboardingContentCard(
                title: page.title,
                description: page.description,
                onSkip: onSkip,
                onNext: onNext,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
