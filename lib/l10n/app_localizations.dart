import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'E-Commerce App'**
  String get app_name;

  /// No description provided for @onboarding_skip_button.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboarding_skip_button;

  /// No description provided for @onboarding_next_button.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboarding_next_button;

  /// No description provided for @onboarding_get_started_button.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboarding_get_started_button;

  /// No description provided for @onboarding_page_one_title.
  ///
  /// In en, this message translates to:
  /// **'We serve incomparable delicacies'**
  String get onboarding_page_one_title;

  /// No description provided for @onboarding_page_one_description.
  ///
  /// In en, this message translates to:
  /// **'All the best restaurants with their top menu waiting for you, they can\'t wait for our order to be placed.'**
  String get onboarding_page_one_description;

  /// No description provided for @onboarding_page_two_title.
  ///
  /// In en, this message translates to:
  /// **'Fastest delivery to your home'**
  String get onboarding_page_two_title;

  /// No description provided for @onboarding_page_two_description.
  ///
  /// In en, this message translates to:
  /// **'We make sure ordering your food is the most comfortable and fun. It should not be hard to order food.'**
  String get onboarding_page_two_description;

  /// No description provided for @onboarding_page_three_title.
  ///
  /// In en, this message translates to:
  /// **'Best offers on your favorites'**
  String get onboarding_page_three_title;

  /// No description provided for @onboarding_page_three_description.
  ///
  /// In en, this message translates to:
  /// **'We are not selling out. The prices in our app are the same as in the restaurants.'**
  String get onboarding_page_three_description;

  /// No description provided for @onboarding_version_app.
  ///
  /// In en, this message translates to:
  /// **'Version: {version}'**
  String onboarding_version_app(Object version);

  /// No description provided for @onboarding_version_sdk.
  ///
  /// In en, this message translates to:
  /// **'SDK: {sdkversion}'**
  String onboarding_version_sdk(Object sdkversion);

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get login_title;

  /// No description provided for @login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to your account'**
  String get login_subtitle;

  /// No description provided for @login_email_label.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get login_email_label;

  /// No description provided for @login_email_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get login_email_placeholder;

  /// No description provided for @login_password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_password_label;

  /// No description provided for @login_password_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get login_password_placeholder;

  /// No description provided for @login_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get login_forgot_password;

  /// No description provided for @login_sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get login_sign_in_button;

  /// No description provided for @login_or_separator.
  ///
  /// In en, this message translates to:
  /// **'Or sign in with'**
  String get login_or_separator;

  /// No description provided for @login_register_text.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get login_register_text;

  /// No description provided for @login_register_link.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get login_register_link;

  /// No description provided for @registration_title.
  ///
  /// In en, this message translates to:
  /// **'Create your new account'**
  String get registration_title;

  /// No description provided for @registration_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account to start looking for the food you like'**
  String get registration_subtitle;

  /// No description provided for @registration_email_label.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get registration_email_label;

  /// No description provided for @registration_email_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get registration_email_placeholder;

  /// No description provided for @registration_username_label.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get registration_username_label;

  /// No description provided for @registration_username_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter User Name'**
  String get registration_username_placeholder;

  /// No description provided for @registration_password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registration_password_label;

  /// No description provided for @registration_password_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get registration_password_placeholder;

  /// No description provided for @registration_terms_prefix.
  ///
  /// In en, this message translates to:
  /// **'I Agree with '**
  String get registration_terms_prefix;

  /// No description provided for @registration_terms_of_service.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get registration_terms_of_service;

  /// No description provided for @registration_terms_and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get registration_terms_and;

  /// No description provided for @registration_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get registration_privacy_policy;

  /// No description provided for @registration_register_button.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registration_register_button;

  /// No description provided for @recovery_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get recovery_password_title;

  /// No description provided for @recovery_password_description.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you confirmation code to reset your password'**
  String get recovery_password_description;

  /// No description provided for @recovery_password_email_label.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get recovery_password_email_label;

  /// No description provided for @recovery_password_email_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get recovery_password_email_placeholder;

  /// No description provided for @recovery_password_continue_button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get recovery_password_continue_button;

  /// No description provided for @otp_verification_title.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp_verification_title;

  /// No description provided for @otp_verification_page_title.
  ///
  /// In en, this message translates to:
  /// **'Email verification'**
  String get otp_verification_page_title;

  /// No description provided for @otp_verification_instruction.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code we send you on:'**
  String get otp_verification_instruction;

  /// No description provided for @otp_verification_didnt_receive.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get otp_verification_didnt_receive;

  /// No description provided for @otp_verification_resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get otp_verification_resend;

  /// No description provided for @otp_verification_continue_button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get otp_verification_continue_button;

  /// No description provided for @home_your_location.
  ///
  /// In en, this message translates to:
  /// **'Your Location'**
  String get home_your_location;

  /// No description provided for @home_header_title.
  ///
  /// In en, this message translates to:
  /// **'Provide the best food for you'**
  String get home_header_title;

  /// No description provided for @home_select_location.
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get home_select_location;

  /// No description provided for @home_find_by_category.
  ///
  /// In en, this message translates to:
  /// **'Find by Category'**
  String get home_find_by_category;

  /// No description provided for @home_see_all.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get home_see_all;

  /// No description provided for @home_bottom_nav_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home_bottom_nav_home;

  /// No description provided for @home_bottom_nav_shopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get home_bottom_nav_shopping;

  /// No description provided for @home_bottom_nav_chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get home_bottom_nav_chat;

  /// No description provided for @home_bottom_nav_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get home_bottom_nav_profile;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
