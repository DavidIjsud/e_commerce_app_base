# Onboarding Feature

This feature implements a clean, modern onboarding experience for the e-commerce app with proper architecture following clean architecture principles.

## Architecture

The feature follows a clean architecture pattern with three layers:

```
lib/features/onboarding/
├── data/           # Data layer (repositories, data sources, models)
├── domain/         # Domain layer (entities, use cases, repository interfaces)
└── presentation/   # Presentation layer (UI, blocs, widgets)
    ├── blocs/      # Business logic components
    ├── pages/      # Full screen pages
    └── widgets/    # Reusable UI components
```

## Features

- **Carousel Navigation**: Smooth page swiping with PageView
- **State Management**: BLoC pattern for reactive state management
- **Custom Design**: Orange theme using `primaryHoverIris` color
- **Typography**: Uses `PalmyrasoftTypography` for consistent text styling
- **Responsive**: Adapts to different screen sizes
- **Dependency Injection**: Uses GetIt for bloc registration

## Components

### 1. OnboardingBloc
- Manages onboarding state (current page, total pages, navigation)
- Handles page changes, skip, and next actions
- Uses Equatable for state comparison

### 2. OnboardingCarousel
- Main carousel widget with PageView
- Handles page swiping and navigation
- Integrates with OnboardingBloc for state management

### 3. OnboardingContentCard
- Orange card overlay with content
- Displays title, description, page indicators, and navigation buttons
- Uses theme colors and typography

### 4. OnboardingPage
- Main page that orchestrates all components
- Provides BlocProvider for state management
- Handles navigation to main app

## Usage

### Basic Usage

```dart
import 'package:e_commerce_app_base/features/onboarding/presentation/pages/onboarding_page.dart';

MaterialApp(
  home: OnboardingPage(),
)
```

### With Dependency Injection

The OnboardingBloc is automatically registered in the GetIt injector:

```dart
// In your app initialization
Get.init(config: config);

// The bloc is automatically available
final bloc = Get.injector<OnboardingBloc>();
```

### Customizing Content

Update the `onboardingPages` list in `OnboardingPage`:

```dart
final onboardingPages = [
  const OnboardingPageData(
    title: "Your Custom Title",
    description: "Your custom description",
    backgroundImage: "assets/images/your_image.jpg",
  ),
  // Add more pages...
];
```

## Required Assets

Add the following images to `assets/images/`:

1. `onboarding_burger.jpg` - Gourmet burger image
2. `onboarding_delivery.jpg` - Delivery service image  
3. `onboarding_tracking.jpg` - Order tracking image

## Dependencies

The feature requires these dependencies (already added to pubspec.yaml):

- `flutter_bloc: ^8.1.6` - State management
- `equatable: ^2.0.5` - State comparison
- `get_it: ^8.0.3` - Dependency injection

## Theme Integration

The feature uses your existing theme system:

- **Colors**: `PalmyrasoftThemeColors.primaryHoverIris` for the orange card
- **Typography**: `PalmyrasoftTypography` for text styling
- **Responsive Design**: Adapts to different screen sizes

## Navigation

The feature provides callbacks for navigation:

- `onSkip`: Called when user presses skip
- `onComplete`: Called when user completes onboarding

Implement these in your app to navigate to the main app or login screen.

## State Management

The OnboardingBloc manages:

- Current page index
- Total number of pages
- Whether current page is the last page
- Navigation state

States extend Equatable for efficient state comparison and rebuilds.

## Best Practices

1. **No setState**: Uses BLoC pattern to avoid unnecessary rebuilds
2. **Separation of Concerns**: UI, business logic, and data are separated
3. **Reusable Components**: Widgets are modular and reusable
4. **Type Safety**: Strong typing throughout the feature
5. **Documentation**: Comprehensive comments and documentation

## Future Enhancements

- Add animations for page transitions
- Implement onboarding completion persistence
- Add accessibility features
- Support for different onboarding flows
- A/B testing capabilities 