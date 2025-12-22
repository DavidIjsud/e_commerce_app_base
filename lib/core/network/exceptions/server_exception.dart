import 'package:e_commerce_app_base/core/network/exceptions/api_exception.dart';

/// Exception for server-related errors (4xx, 5xx)
class ServerException extends ApiException {
  const ServerException(super.message, super.statusCode);

  /// Bad request (400)
  factory ServerException.badRequest([String? message]) {
    return ServerException(
      message ?? 'Bad request. Please check your input.',
      400,
    );
  }

  /// Unauthorized (401)
  factory ServerException.unauthorized([String? message]) {
    return ServerException(
      message ?? 'Unauthorized. Please login again.',
      401,
    );
  }

  /// Forbidden (403)
  factory ServerException.forbidden([String? message]) {
    return ServerException(
      message ?? 'Forbidden. You don\'t have permission to access this resource.',
      403,
    );
  }

  /// Not found (404)
  factory ServerException.notFound([String? message]) {
    return ServerException(
      message ?? 'Resource not found.',
      404,
    );
  }

  /// Internal server error (500)
  factory ServerException.internalServerError([String? message]) {
    return ServerException(
      message ?? 'Internal server error. Please try again later.',
      500,
    );
  }

  /// Bad gateway (502)
  factory ServerException.badGateway([String? message]) {
    return ServerException(
      message ?? 'Bad gateway. Please try again later.',
      502,
    );
  }

  /// Service unavailable (503)
  factory ServerException.serviceUnavailable([String? message]) {
    return ServerException(
      message ?? 'Service unavailable. Please try again later.',
      503,
    );
  }
}



