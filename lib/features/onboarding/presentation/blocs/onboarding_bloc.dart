import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_events.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_states.dart';

/// BLoC for managing onboarding state and business logic
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingSkipPressed>(_onSkipPressed);
    on<OnboardingNextPressed>(_onNextPressed);
    on<OnboardingCompleted>(_onCompleted);
  }

  /// Handle page change events
  void _onPageChanged(OnboardingPageChanged event, Emitter<OnboardingState> emit) {
    try {
      // Emit loading state while transitioning
      emit(state.copyWith(status: OnboardingStatus.loading));
      
      final totalPages = state.totalPages;
      final isLastPage = event.pageIndex == totalPages - 1;
      
      // Emit active state with updated page information
      emit(state.copyWith(
        status: OnboardingStatus.active,
        currentPageIndex: event.pageIndex,
        isLastPage: isLastPage,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OnboardingStatus.error,
        errorMessage: 'Failed to change page: ${e.toString()}',
      ));
    }
  }

  /// Handle skip button press
  void _onSkipPressed(OnboardingSkipPressed event, Emitter<OnboardingState> emit) {
    try {
      emit(state.copyWith(status: OnboardingStatus.loading));
      
      // Navigate to the last page or complete onboarding
      final lastPageIndex = state.totalPages - 1;
      emit(state.copyWith(
        status: OnboardingStatus.active,
        currentPageIndex: lastPageIndex,
        isLastPage: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: OnboardingStatus.error,
        errorMessage: 'Failed to skip onboarding: ${e.toString()}',
      ));
    }
  }

  /// Handle next button press
  void _onNextPressed(OnboardingNextPressed event, Emitter<OnboardingState> emit) {
    try {
      emit(state.copyWith(status: OnboardingStatus.loading));
      
      if (!state.isLastPage) {
        // Move to next page
        final nextPage = state.currentPageIndex + 1;
        final isLastPage = nextPage == state.totalPages - 1;
        
        emit(state.copyWith(
          status: OnboardingStatus.active,
          currentPageIndex: nextPage,
          isLastPage: isLastPage,
        ));
      } else {
        // Complete onboarding
        emit(state.copyWith(status: OnboardingStatus.completed));
      }
    } catch (e) {
      emit(state.copyWith(
        status: OnboardingStatus.error,
        errorMessage: 'Failed to proceed to next page: ${e.toString()}',
      ));
    }
  }

  /// Handle onboarding completion
  void _onCompleted(OnboardingCompleted event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(status: OnboardingStatus.completed));
  }

  /// Initialize onboarding with first page
  void initializeOnboarding() {
    add(const OnboardingPageChanged(0));
  }

  /// Reset onboarding to initial state
  void resetOnboarding() {
    // Note: This method should be used carefully as it directly emits a state
    // In production, consider using an event instead
  }
} 