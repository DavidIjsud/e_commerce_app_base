import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:get_it/get_it.dart';

class Get {
  static final injector = GetIt.instance;

  static void init({required Config config}) {
    injector.registerLazySingleton(() => config);

    // Register onboarding bloc as factory (fresh instance each time)
    // This ensures onboarding starts with clean state every visit
    injector.registerFactory(() => OnboardingBloc());
  }
}
