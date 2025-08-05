import 'package:equatable/equatable.dart';

/// Enum representing the different states of the onboarding process
enum OnboardingStatus {
  /// Initial state when the bloc is created
  initial,
  
  /// State when onboarding is loading or transitioning
  loading,
  
  /// State when onboarding is active and user can interact
  active,
  
  /// State when onboarding is completed
  completed,
  
  /// State when an error occurs
  error,
}

/// Single state class that manages all onboarding state
class OnboardingState extends Equatable {
  /// Current status of the onboarding process
  final OnboardingStatus status;
  
  /// Current page index (0-based)
  final int currentPageIndex;
  
  /// Total number of pages in the onboarding
  final int totalPages;
  
  /// Whether the current page is the last page
  final bool isLastPage;
  
  /// Error message if status is error
  final String? errorMessage;

  const OnboardingState({
    this.status = OnboardingStatus.initial,
    this.currentPageIndex = 0,
    this.totalPages = 3,
    this.isLastPage = false,
    this.errorMessage,
  });

  /// Create a copy of the state with updated values
  OnboardingState copyWith({
    OnboardingStatus? status,
    int? currentPageIndex,
    int? totalPages,
    bool? isLastPage,
    String? errorMessage,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      totalPages: totalPages ?? this.totalPages,
      isLastPage: isLastPage ?? this.isLastPage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    currentPageIndex,
    totalPages,
    isLastPage,
    errorMessage,
  ];

  /// Helper method to check if onboarding is in initial state
  bool get isInitial => status == OnboardingStatus.initial;

  /// Helper method to check if onboarding is loading
  bool get isLoading => status == OnboardingStatus.loading;

  /// Helper method to check if onboarding is active
  bool get isActive => status == OnboardingStatus.active;

  /// Helper method to check if onboarding is completed
  bool get isCompleted => status == OnboardingStatus.completed;

  /// Helper method to check if onboarding has an error
  bool get hasError => status == OnboardingStatus.error;

  /// Helper method to get the progress percentage (0.0 to 1.0)
  double get progress => totalPages > 0 ? (currentPageIndex + 1) / totalPages : 0.0;
} 