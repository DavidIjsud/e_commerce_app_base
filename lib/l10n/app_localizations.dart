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
