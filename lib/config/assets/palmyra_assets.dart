class PalmyraAssets {
  String get assets => 'assets/ecommerce';
  String get images => '$assets/images';
  String get svgs => '$assets/svgs';
  String get onboarding => '$assets/$images/onboarding';

  //IMAGES

  String get onboarding1 => '$onboarding/onboarding_one.png';

  String get onboarding2 => '$onboarding/onboarding_two.png';

  String get onboarding3 => '$onboarding/onboarding_three.png';

  //ICONS

  // Social Login Icons
  String get googleIcon => '$svgs/google_icon.svg';
  String get facebookIcon => '$svgs/facebook_icon.svg';
  String get appleIcon => '$svgs/apple_icon.svg';

  // Home Images
  String get homeImages => '$images/home';
  String get homeTopImage => '$homeImages/home-top-image.png';
  String get homeCategories => '$homeImages/categories';
  String get homeCategoryHamburger =>
      '$homeCategories/home-category-hamburger.png';
  String get homeCategoryTaco => '$homeCategories/home-category-taco.png';
  String get homeCategoryDrink => '$homeCategories/home-category-drink.png';
  String get homeCategoryPizza => '$homeCategories/home-category-pizza.png';
  String get homeCategoryItems => '$homeImages/category-items';
  String get homeCategoryItemHamburger =>
      '$homeCategoryItems/hamburger/ordinary-burger.png';

  // Reset Password Images
  String get resetPasswordImages => '$images/reset_password';
  String get resetPasswordSuccessIllustration =>
      '$resetPasswordImages/success_illustration.png';
}
