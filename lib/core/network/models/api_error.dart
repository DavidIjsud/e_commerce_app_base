/// API error response model
class ApiError {
  const ApiError({
    required this.message,
    this.code,
    this.errors,
  });

  final String message;
  final String? code;
  final Map<String, dynamic>? errors;

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      message: json['message'] as String? ?? 'An error occurred',
      code: json['code'] as String?,
      errors: json['errors'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      if (code != null) 'code': code,
      if (errors != null) 'errors': errors,
    };
  }

  @override
  String toString() => message;
}



