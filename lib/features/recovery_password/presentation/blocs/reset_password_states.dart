import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/models/reset_password_form_data.dart';

/// Status enum for reset password
enum ResetPasswordStatus { initial, loading, success, error }

/// State for reset password
class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.status = ResetPasswordStatus.initial,
    this.formData = const ResetPasswordFormData(),
    this.isNewPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.errorMessage,
    this.newPasswordError,
    this.confirmPasswordError,
  });

  final ResetPasswordStatus status;
  final ResetPasswordFormData formData;
  final bool isNewPasswordVisible;
  final bool isConfirmPasswordVisible;
  final String? errorMessage;
  final String? newPasswordError;
  final String? confirmPasswordError;

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
    ResetPasswordFormData? formData,
    bool? isNewPasswordVisible,
    bool? isConfirmPasswordVisible,
    String? errorMessage,
    String? newPasswordError,
    String? confirmPasswordError,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      formData: formData ?? this.formData,
      isNewPasswordVisible: isNewPasswordVisible ?? this.isNewPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      errorMessage: errorMessage,
      newPasswordError: newPasswordError,
      confirmPasswordError: confirmPasswordError,
    );
  }

  bool get isInitial => status == ResetPasswordStatus.initial;
  bool get isLoading => status == ResetPasswordStatus.loading;
  bool get isSuccess => status == ResetPasswordStatus.success;
  bool get isError => status == ResetPasswordStatus.error;

  @override
  List<Object?> get props => [
    status,
    formData,
    isNewPasswordVisible,
    isConfirmPasswordVisible,
    errorMessage,
    newPasswordError,
    confirmPasswordError,
  ];
}
