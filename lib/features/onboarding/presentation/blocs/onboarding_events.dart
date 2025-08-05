import 'package:equatable/equatable.dart';

/// Events for the OnboardingBloc
abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when the user changes to a different page
class OnboardingPageChanged extends OnboardingEvent {
  final int pageIndex;

  const OnboardingPageChanged(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

/// Event triggered when the user presses the skip button
class OnboardingSkipPressed extends OnboardingEvent {}

/// Event triggered when the user presses the next button
class OnboardingNextPressed extends OnboardingEvent {}

/// Event triggered when the onboarding is completed
class OnboardingCompleted extends OnboardingEvent {} 