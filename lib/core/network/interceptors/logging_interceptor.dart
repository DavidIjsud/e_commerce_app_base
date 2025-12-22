import 'dart:developer';
import 'package:dio/dio.dart';

/// Interceptor for logging HTTP requests and responses
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({this.enabled = true});

  final bool enabled;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enabled) {
      log('┌─────────────────────────────────────────────────────────');
      log('│ REQUEST: ${options.method} ${options.uri}');
      log('│ Headers: ${options.headers}');
      if (options.data != null) {
        log('│ Body: ${options.data}');
      }
      log('└─────────────────────────────────────────────────────────');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (enabled) {
      log('┌─────────────────────────────────────────────────────────');
      log('│ RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
      log('│ Data: ${response.data}');
      log('└─────────────────────────────────────────────────────────');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enabled) {
      log('┌─────────────────────────────────────────────────────────');
      log('│ ERROR: ${err.response?.statusCode} ${err.requestOptions.uri}');
      log('│ Message: ${err.message}');
      if (err.response?.data != null) {
        log('│ Error Data: ${err.response?.data}');
      }
      log('└─────────────────────────────────────────────────────────');
    }
    super.onError(err, handler);
  }
}
