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
}
