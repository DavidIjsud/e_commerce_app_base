/// Modelo de datos para el request de login
class LoginRequestModel {
  final String email;
  final String? password;

  const LoginRequestModel({
    required this.email,
    this.password,
  });

  /// Convierte el modelo a JSON para enviar en el request
  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'email': email,
    };

    // Solo incluir password si está presente (login con email/password)
    if (password != null && password!.isNotEmpty) {
      json['password'] = password;
    }

    return json;
  }
}

