// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get app_name => 'Aplicación de E-Commerce';

  @override
  String get onboarding_skip_button => 'Saltar';

  @override
  String get onboarding_next_button => 'Siguiente';

  @override
  String get onboarding_get_started_button => 'Comenzar';

  @override
  String get onboarding_page_one_title => 'Servimos delicias incomparables';

  @override
  String get onboarding_page_one_description =>
      'Todos los mejores restaurantes con su menú principal esperando por ti, no pueden esperar a que se haga tu pedido.';

  @override
  String get onboarding_page_two_title => 'Entrega más rápida a tu casa';

  @override
  String get onboarding_page_two_description =>
      'Nos aseguramos de que ordenar tu comida sea lo más cómodo y divertido. No debería ser difícil ordenar comida.';

  @override
  String get onboarding_page_three_title => 'Mejores ofertas en tus favoritos';

  @override
  String get onboarding_page_three_description =>
      'No estamos vendiendo. Los precios en nuestra aplicación son los mismos que en los restaurantes.';

  @override
  String onboarding_version_app(Object version) {
    return 'Versión: $version';
  }

  @override
  String onboarding_version_sdk(Object sdkversion) {
    return 'SDK: $sdkversion';
  }

  @override
  String get login_title => 'Inicia sesión en tu cuenta';

  @override
  String get login_subtitle => 'Por favor inicia sesión en tu cuenta';

  @override
  String get login_email_label => 'Correo electrónico';

  @override
  String get login_email_placeholder => 'Ingresa tu correo';

  @override
  String get login_password_label => 'Contraseña';

  @override
  String get login_password_placeholder => 'Contraseña';

  @override
  String get login_forgot_password => '¿Olvidaste tu contraseña?';

  @override
  String get login_sign_in_button => 'Iniciar Sesión';

  @override
  String get login_or_separator => 'O inicia sesión con';

  @override
  String get login_register_text => '¿No tienes una cuenta?';

  @override
  String get login_register_link => 'Regístrate';

  @override
  String get registration_title => 'Crea tu nueva cuenta';

  @override
  String get registration_subtitle =>
      'Crea una cuenta para comenzar a buscar la comida que te gusta';

  @override
  String get registration_email_label => 'Correo electrónico';

  @override
  String get registration_email_placeholder => 'Ingresa tu correo';

  @override
  String get registration_username_label => 'Nombre de usuario';

  @override
  String get registration_username_placeholder =>
      'Ingresa tu nombre de usuario';

  @override
  String get registration_password_label => 'Contraseña';

  @override
  String get registration_password_placeholder => 'Ingresa tu contraseña';

  @override
  String get registration_terms_prefix => 'Estoy de acuerdo con los ';

  @override
  String get registration_terms_of_service => 'Términos de Servicio';

  @override
  String get registration_terms_and => ' y la ';

  @override
  String get registration_privacy_policy => 'Política de Privacidad';

  @override
  String get registration_register_button => 'Registrarse';

  @override
  String get recovery_password_title => '¿Olvidaste tu contraseña?';

  @override
  String get recovery_password_description =>
      'Ingresa tu dirección de correo electrónico y te enviaremos un código de confirmación para restablecer tu contraseña';

  @override
  String get recovery_password_email_label => 'Correo electrónico';

  @override
  String get recovery_password_email_placeholder => 'Ingresa tu correo';

  @override
  String get recovery_password_continue_button => 'Continuar';

  @override
  String get otp_verification_title => 'OTP';

  @override
  String get otp_verification_page_title =>
      'Verificación de correo electrónico';

  @override
  String get otp_verification_instruction =>
      'Ingresa el código de verificación que te enviamos a:';

  @override
  String get otp_verification_didnt_receive => '¿No recibiste el código?';

  @override
  String get otp_verification_resend => 'Reenviar';

  @override
  String get otp_verification_continue_button => 'Continuar';
}
