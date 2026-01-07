import 'package:e_commerce_app_base/config/assets/palmyra_assets.dart';

class EcommerceAssets extends PalmyraAssets {
  @override
  String get assets => 'assets/ecommerce';

  @override
  String get images => '$assets/images';

  @override
  String get svgs => '$assets/svgs';

  @override
  String get onboarding => '$images/onboarding';

  // Add more specific asset paths if needed

  @override
  String get onboarding1 => '$onboarding/onboarding_one.png';

  @override
  String get onboarding2 => '$onboarding/onboarding_two.png';

  @override
  String get onboarding3 => '$onboarding/onboarding_three.png';

  // Social Login Icons
  @override
  String get googleIcon => '$svgs/google_icon.svg';
  @override
  String get facebookIcon => '$svgs/facebook_icon.svg';
  @override
  String get appleIcon => '$svgs/apple_icon.svg';

  // Home Images
  @override
  String get homeImages => '$images/home';
  @override
  String get homeTopImage => '$homeImages/home-top-image.png';
  @override
  String get homeCategories => '$homeImages/categories';
  @override
  String get homeCategoryHamburger =>
      '$homeCategories/home-category-hamburger.png';
  @override
  String get homeCategoryTaco => '$homeCategories/home-category-taco.png';
  @override
  String get homeCategoryDrink => '$homeCategories/home-category-drink.png';
  @override
  String get homeCategoryPizza => '$homeCategories/home-category-pizza.png';
  @override
  String get homeCategoryItems => '$homeImages/category-items';
  @override
  String get homeCategoryItemHamburger =>
      '$homeCategoryItems/hamburger/ordinary-burger.png';

  // Reset Password Images
  @override
  String get resetPasswordImages => '$images/reset_password';
  @override
  String get resetPasswordSuccessIllustration =>
      '$resetPasswordImages/success_illustration.png';

  // Notification Icons
  @override
  String get porcentRedIcon => '$svgs/porcent_red.svg';
  @override
  String get profileBlackIcon => '$svgs/profile_black.svg';
  @override
  String get successCheckedGreenIcon => '$svgs/success_checked_green_rounded.svg';
  @override
  String get errorRoundedRedIcon => '$svgs/error_rounded_red.svg';
  @override
  String get closedEmailIcon => '$svgs/closed_email.svg';
  @override
  String get cardOrangeIcon => '$svgs/card_orange.svg';
}
