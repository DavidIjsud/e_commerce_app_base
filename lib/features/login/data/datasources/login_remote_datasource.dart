import 'package:dio/dio.dart';
import 'package:e_commerce_app_base/core/network/exceptions/exceptions.dart';
import 'package:e_commerce_app_base/features/login/data/models/login_request_model.dart';
import 'package:e_commerce_app_base/features/login/data/models/login_response_model.dart';

/// DataSource remoto para operaciones de login
/// 
/// Se comunica directamente con la API usando Dio
abstract class LoginRemoteDataSource {
  /// Realiza el login del usuario
  Future<LoginResponseModel> login(LoginRequestModel request);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await dio.post(
        '/api/v1/auth/customer',
        data: request.toJson(),
      );

      return LoginResponseModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // El ErrorInterceptor ya transformó la excepción a ApiException
      // y la colocó en e.error
      if (e.error is ApiException) {
        throw e.error as ApiException;
      }

      // Si por alguna razón no hay ApiException, lanzamos una genérica
      throw ServerException(
        e.message ?? 'An error occurred during login',
        e.response?.statusCode,
      );
    } catch (e) {
      // Cualquier otra excepción no esperada
      throw ServerException(
        'An unexpected error occurred: ${e.toString()}',
        null,
      );
    }
  }
}

