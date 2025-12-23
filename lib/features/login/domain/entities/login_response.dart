import 'package:e_commerce_app_base/features/login/domain/entities/customer.dart';

/// Entidad LoginResponse del dominio
/// 
/// Representa la respuesta de login exitoso
class LoginResponse {
  final String accessToken;
  final Customer customer;

  const LoginResponse({
    required this.accessToken,
    required this.customer,
  });
}

