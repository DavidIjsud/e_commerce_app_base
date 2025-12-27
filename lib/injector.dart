import 'package:dio/dio.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/core/network/dio_client.dart';
import 'package:e_commerce_app_base/core/storage/storage.dart';
import 'package:e_commerce_app_base/features/login/data/data.dart';
import 'package:e_commerce_app_base/features/login/domain/domain.dart';
import 'package:e_commerce_app_base/features/home/data/data.dart';
import 'package:e_commerce_app_base/features/home/domain/domain.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_bloc.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/recovery_password_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/reset_password_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_bloc.dart';
import 'package:e_commerce_app_base/navigation/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

class Get {
  static final injector = GetIt.instance;

  static void init({required Config config}) {
    injector.registerLazySingleton(() => config);

    // Register Storage Repository as singleton
    // Registramos la interfaz, pero inyectamos la implementación concreta
    injector.registerLazySingleton<StorageRepository>(
      () => SecureStorage(),
    );

    // Register DIO client as singleton
    // Usa StorageRepository para obtener el token de forma asíncrona
    injector.registerLazySingleton<Dio>(
      () {
        final storage = injector<StorageRepository>();
        return DioClient.create(
          config.apiBaseUrl,
          enableLogging: config.flavor == Flavor.ecommerceDevelopment,
          getTokenAsync: () async {
            return await storage.read(StorageKeys.accessToken);
          },
          onTokenExpiredAsync: () async {
            // Limpiar tokens cuando expiren
            final storage = injector<StorageRepository>();
            await storage.delete(StorageKeys.accessToken);
            await storage.delete(StorageKeys.refreshToken);
            // TODO: Navegar a login si es necesario
            // Esto requeriría acceso al router, que se puede hacer después
          },
        );
      },
    );

    // Register router as singleton (single instance for the entire app)
    injector.registerLazySingleton<GoRouter>(() => AppRouter.createRouter());

    // Register Login DataSource as singleton
    injector.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(injector<Dio>()),
    );

    // Register Login Repository as singleton
    injector.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(
        remoteDataSource: injector<LoginRemoteDataSource>(),
        storage: injector<StorageRepository>(),
      ),
    );

    // Register Products DataSource as singleton
    injector.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(injector<Dio>()),
    );

    // Register Products Repository as singleton
    injector.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(
        remoteDataSource: injector<ProductsRemoteDataSource>(),
      ),
    );

    // Register onboarding bloc as factory (fresh instance each time)
    // This ensures onboarding starts with clean state every visit
    injector.registerFactory(() => OnboardingBloc());

    // Register login bloc as factory (fresh instance each time)
    injector.registerFactory(
      () => LoginBloc(loginRepository: injector<LoginRepository>()),
    );

    // Register registration bloc as factory (fresh instance each time)
    injector.registerFactory(() => RegistrationBloc());

    // Register recovery password bloc as factory (fresh instance each time)
    injector.registerFactory(() => RecoveryPasswordBloc());

    // Register reset password bloc as factory (fresh instance each time)
    injector.registerFactory(() => ResetPasswordBloc());

    // Register home bloc as factory (fresh instance each time)
    injector.registerFactory(
      () => HomeBloc(
        productsRepository: injector<ProductsRepository>(),
        config: injector<Config>(),
      ),
    );

    // Note: OTPVerificationBloc is created directly in the page with email parameter
    // so it doesn't need to be registered in GetIt
  }
}
