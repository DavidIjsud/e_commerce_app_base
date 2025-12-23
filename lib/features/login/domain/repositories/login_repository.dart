import 'package:e_commerce_app_base/features/login/domain/entities/login_response.dart';

/// Repositorio abstracto para operaciones de login
/// 
/// Define el contrato para la capa de datos
/// La implementación concreta estará en la capa de datos
abstract class LoginRepository {
  /// Realiza el login del usuario
  /// 
  /// [email] Email del usuario (requerido)
  /// [password] Contraseña del usuario (opcional, para login con provider)
  /// 
  /// Retorna [LoginResponse] si el login es exitoso
  /// Lanza una excepción si el login falla
  Future<LoginResponse> login({
    required String email,
    String? password,
  });
}

