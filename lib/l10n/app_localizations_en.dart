// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'E-Commerce App';

  @override
  String get onboarding_skip_button => 'Skip';

  @override
  String get onboarding_next_button => 'Next';

  @override
  String get onboarding_get_started_button => 'Get Started';

  @override
  String get onboarding_page_one_title => 'We serve incomparable delicacies';

  @override
  String get onboarding_page_one_description =>
      'All the best restaurants with their top menu waiting for you, they can\'t wait for our order to be placed.';

  @override
  String get onboarding_page_two_title => 'Fastest delivery to your home';

  @override
  String get onboarding_page_two_description =>
      'We make sure ordering your food is the most comfortable and fun. It should not be hard to order food.';

  @override
  String get onboarding_page_three_title => 'Best offers on your favorites';

  @override
  String get onboarding_page_three_description =>
      'We are not selling out. The prices in our app are the same as in the restaurants.';

  @override
  String onboarding_version_app(Object version) {
    return 'Version: $version';
  }

  @override
  String onboarding_version_sdk(Object sdkversion) {
    return 'SDK: $sdkversion';
  }
}
