/// Data model for onboarding page content
///
/// This model represents the data structure for each onboarding page.
/// It's used by the presentation layer widgets to display content.
class OnboardingPageData {
  /// The title displayed on the onboarding page
  final String title;

  /// The description text displayed on the onboarding page
  final String description;

  /// The background image path for the onboarding page
  final String backgroundImage;

  const OnboardingPageData({
    required this.title,
    required this.description,
    required this.backgroundImage,
  });

  /// Create a copy of this model with updated values
  OnboardingPageData copyWith({
    String? title,
    String? description,
    String? backgroundImage,
  }) {
    return OnboardingPageData(
      title: title ?? this.title,
      description: description ?? this.description,
      backgroundImage: backgroundImage ?? this.backgroundImage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OnboardingPageData &&
        other.title == title &&
        other.description == description &&
        other.backgroundImage == backgroundImage;
  }

  @override
  int get hashCode {
    return title.hashCode ^ description.hashCode ^ backgroundImage.hashCode;
  }

  @override
  String toString() {
    return 'OnboardingPageData(title: $title, description: $description, backgroundImage: $backgroundImage)';
  }
}
