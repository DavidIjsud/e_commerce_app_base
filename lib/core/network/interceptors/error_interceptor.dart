import 'package:dio/dio.dart';
import 'package:e_commerce_app_base/core/network/exceptions/exceptions.dart';
import 'package:e_commerce_app_base/core/network/models/api_error.dart';

/// Interceptor for handling and transforming errors
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final errorData = err.response?.data;

    ApiException exception;

    // Handle network errors (no connection, timeout, etc.)
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        exception = NetworkException.timeout();
        break;
      case DioExceptionType.connectionError:
        exception = NetworkException.connectionError();
        break;
      case DioExceptionType.badResponse:
        // Handle server errors (4xx, 5xx)
        exception = _handleServerError(statusCode, errorData);
        break;
      default:
        exception = NetworkException.noInternet();
    }

    // Create a new DioException with our custom exception
    final customException = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: exception,
      message: exception.message,
    );

    handler.reject(customException);
  }

  ApiException _handleServerError(int? statusCode, dynamic errorData) {
    // Try to parse error message from response
    String? errorMessage;
    if (errorData is Map<String, dynamic>) {
      try {
        final apiError = ApiError.fromJson(errorData);
        errorMessage = apiError.message;
      } catch (_) {
        errorMessage = errorData['message'] as String?;
      }
    }

    switch (statusCode) {
      case 400:
        return ServerException.badRequest(errorMessage);
      case 401:
        return ServerException.unauthorized(errorMessage);
      case 403:
        return ServerException.forbidden(errorMessage);
      case 404:
        return ServerException.notFound(errorMessage);
      case 500:
        return ServerException.internalServerError(errorMessage);
      case 502:
        return ServerException.badGateway(errorMessage);
      case 503:
        return ServerException.serviceUnavailable(errorMessage);
      default:
        return ServerException(
          errorMessage ?? 'An error occurred',
          statusCode ?? 0,
        );
    }
  }
}
