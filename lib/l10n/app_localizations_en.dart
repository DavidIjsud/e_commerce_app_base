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

  @override
  String get login_title => 'Login to your account';

  @override
  String get login_subtitle => 'Please sign in to your account';

  @override
  String get login_email_label => 'Email Address';

  @override
  String get login_email_placeholder => 'Enter Email';

  @override
  String get login_password_label => 'Password';

  @override
  String get login_password_placeholder => 'Password';

  @override
  String get login_forgot_password => 'Forgot password?';

  @override
  String get login_sign_in_button => 'Sign In';

  @override
  String get login_or_separator => 'Or sign in with';

  @override
  String get login_register_text => 'Don\'t have an account?';

  @override
  String get login_register_link => 'Register';

  @override
  String get registration_title => 'Create your new account';

  @override
  String get registration_subtitle =>
      'Create an account to start looking for the food you like';

  @override
  String get registration_email_label => 'Email Address';

  @override
  String get registration_email_placeholder => 'Enter Email';

  @override
  String get registration_username_label => 'User Name';

  @override
  String get registration_username_placeholder => 'Enter User Name';

  @override
  String get registration_password_label => 'Password';

  @override
  String get registration_password_placeholder => 'Enter Password';

  @override
  String get registration_terms_prefix => 'I Agree with ';

  @override
  String get registration_terms_of_service => 'Terms of Service';

  @override
  String get registration_terms_and => ' and ';

  @override
  String get registration_privacy_policy => 'Privacy Policy';

  @override
  String get registration_register_button => 'Register';

  @override
  String get recovery_password_title => 'Forgot password?';

  @override
  String get recovery_password_description =>
      'Enter your email address and we\'ll send you confirmation code to reset your password';

  @override
  String get recovery_password_email_label => 'Email Address';

  @override
  String get recovery_password_email_placeholder => 'Enter Email';

  @override
  String get recovery_password_continue_button => 'Continue';

  @override
  String get otp_verification_title => 'OTP';

  @override
  String get otp_verification_page_title => 'Email verification';

  @override
  String get otp_verification_instruction =>
      'Enter the verification code we send you on:';

  @override
  String get otp_verification_didnt_receive => 'Didn\'t receive code?';

  @override
  String get otp_verification_resend => 'Resend';

  @override
  String get otp_verification_continue_button => 'Continue';
}
