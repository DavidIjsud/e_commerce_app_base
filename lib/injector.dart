import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_bloc.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/recovery_password_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_bloc.dart';
import 'package:e_commerce_app_base/navigation/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

class Get {
  static final injector = GetIt.instance;

  static void init({required Config config}) {
    injector.registerLazySingleton(() => config);

    // Register router as singleton (single instance for the entire app)
    injector.registerLazySingleton<GoRouter>(() => AppRouter.createRouter());

    // Register onboarding bloc as factory (fresh instance each time)
    // This ensures onboarding starts with clean state every visit
    injector.registerFactory(() => OnboardingBloc());

    // Register login bloc as factory (fresh instance each time)
    injector.registerFactory(() => LoginBloc());

    // Register registration bloc as factory (fresh instance each time)
    injector.registerFactory(() => RegistrationBloc());

    // Register recovery password bloc as factory (fresh instance each time)
    injector.registerFactory(() => RecoveryPasswordBloc());

    // Register home bloc as factory (fresh instance each time)
    injector.registerFactory(() => HomeBloc());

    // Note: OTPVerificationBloc is created directly in the page with email parameter
    // so it doesn't need to be registered in GetIt
  }
}
