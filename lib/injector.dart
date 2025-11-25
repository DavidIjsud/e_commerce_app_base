import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_bloc.dart';
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
  }
}
