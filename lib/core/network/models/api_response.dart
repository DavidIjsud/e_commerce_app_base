/// Generic API response model
class ApiResponse<T> {
  const ApiResponse({
    required this.data,
    this.message,
    this.statusCode,
    this.success = true,
  });

  final T data;
  final String? message;
  final int? statusCode;
  final bool success;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ApiResponse<T>(
      data: fromJsonT(json['data'] ?? json),
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
      success: json['success'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'data': toJsonT(data),
      if (message != null) 'message': message,
      if (statusCode != null) 'statusCode': statusCode,
      'success': success,
    };
  }
}



