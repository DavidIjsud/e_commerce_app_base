# Onboarding Images

This directory contains the onboarding screen images that are accessed through the `PalmyraAssets` configuration.

## Required Images:

1. `onboarding_burger.jpg` - Gourmet burger image for first onboarding screen
2. `onboarding_delivery.jpg` - Delivery service image for second onboarding screen  
3. `onboarding_tracking.jpg` - Order tracking image for third onboarding screen

## Asset Paths:

The images are accessed through the config system:
- `config.assets.onboarding1` → `assets/ecommerce/images/onboarding/onboarding_burger.jpg`
- `config.assets.onboarding2` → `assets/ecommerce/images/onboarding/onboarding_delivery.jpg`
- `config.assets.onboarding3` → `assets/ecommerce/images/onboarding/onboarding_tracking.jpg`

## Image Requirements:

- **Resolution**: At least 1080x1920 for mobile
- **Format**: JPG or PNG
- **Quality**: High quality with good contrast for text overlay
- **Theme**: Food delivery/e-commerce related
- **Optimization**: Compressed for mobile performance

## Usage in Code:

```dart
// Get config from dependency injection
final config = Get.injector<Config>();

// Use in OnboardingPageData
OnboardingPageData(
  title: "We serve incomparable delicacies",
  description: "All the best restaurants...",
  backgroundImage: config.assets.onboarding1, // Uses injected config
)
``` 