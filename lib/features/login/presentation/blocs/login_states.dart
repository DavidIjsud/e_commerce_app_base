import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/login/presentation/models/models.dart';

/// Enum for login status
enum LoginStatus { initial, loading, success, error }

/// Single state class for login
class LoginState extends Equatable {
  final LoginStatus status;
  final LoginFormData formData;
  final String? errorMessage;
  final bool isPasswordVisible;

  const LoginState({
    this.status = LoginStatus.initial,
    this.formData = const LoginFormData(),
    this.errorMessage,
    this.isPasswordVisible = false,
  });

  LoginState copyWith({
    LoginStatus? status,
    LoginFormData? formData,
    String? errorMessage,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      status: status ?? this.status,
      formData: formData ?? this.formData,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  bool get isInitial => status == LoginStatus.initial;
  bool get isLoading => status == LoginStatus.loading;
  bool get isSuccess => status == LoginStatus.success;
  bool get isError => status == LoginStatus.error;

  @override
  List<Object?> get props => [
    status,
    formData,
    errorMessage,
    isPasswordVisible,
  ];
}
