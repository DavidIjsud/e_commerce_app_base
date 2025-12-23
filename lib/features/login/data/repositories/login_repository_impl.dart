import 'package:e_commerce_app_base/core/network/exceptions/exceptions.dart';
import 'package:e_commerce_app_base/core/storage/storage.dart';
import 'package:e_commerce_app_base/features/login/data/datasources/login_remote_datasource.dart';
import 'package:e_commerce_app_base/features/login/data/models/login_request_model.dart';
import 'package:e_commerce_app_base/features/login/domain/domain.dart';

/// Implementación del repositorio de login
/// 
/// Conecta la capa de dominio con la capa de datos
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final StorageRepository storage;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.storage,
  });

  @override
  Future<LoginResponse> login({
    required String email,
    String? password,
  }) async {
    try {
      final request = LoginRequestModel(
        email: email,
        password: password,
      );

      final response = await remoteDataSource.login(request);

      // Guardar el token en almacenamiento seguro
      await storage.write(
        StorageKeys.accessToken,
        response.accessToken,
      );

      // Retornar la entidad del dominio
      return response.toEntity();
    } on ApiException {
      // Re-lanzar excepciones de API sin modificar
      rethrow;
    } catch (e) {
      // Cualquier otra excepción no esperada
      throw ServerException(
        'An unexpected error occurred: ${e.toString()}',
        null,
      );
    }
  }
}

