import 'package:equatable/equatable.dart';

/// Form data model for reset password
class ResetPasswordFormData extends Equatable {
  final String newPassword;
  final String confirmPassword;

  const ResetPasswordFormData({
    this.newPassword = '',
    this.confirmPassword = '',
  });

  ResetPasswordFormData copyWith({
    String? newPassword,
    String? confirmPassword,
  }) {
    return ResetPasswordFormData(
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object?> get props => [newPassword, confirmPassword];
}
