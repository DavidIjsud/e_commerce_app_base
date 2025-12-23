import 'package:e_commerce_app_base/features/login/data/models/customer_model.dart';
import 'package:e_commerce_app_base/features/login/domain/entities/login_response.dart';

/// Modelo de datos (DTO) para LoginResponse
/// 
/// Extiende la entidad del dominio y añade métodos de serialización
class LoginResponseModel extends LoginResponse {
  const LoginResponseModel({
    required super.accessToken,
    required super.customer,
  });

  /// Crea un LoginResponseModel desde un JSON
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access_token'] as String,
      customer: CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
    );
  }

  /// Convierte el modelo a JSON
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'customer': (customer as CustomerModel).toJson(),
    };
  }

  /// Convierte el modelo a entidad del dominio
  LoginResponse toEntity() {
    return LoginResponse(
      accessToken: accessToken,
      customer: (customer as CustomerModel).toEntity(),
    );
  }
}

