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
}
