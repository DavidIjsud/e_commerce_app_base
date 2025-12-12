import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/reset_password_events.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/reset_password_states.dart';

/// BLoC for managing reset password state
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(const ResetPasswordState()) {
    on<ResetPasswordNewPasswordChanged>(_onNewPasswordChanged);
    on<ResetPasswordConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ResetPasswordNewPasswordVisibilityToggled>(
      _onNewPasswordVisibilityToggled,
    );
    on<ResetPasswordConfirmPasswordVisibilityToggled>(
      _onConfirmPasswordVisibilityToggled,
    );
    on<ResetPasswordSubmitted>(_onSubmitted);
  }

  void _onNewPasswordChanged(
    ResetPasswordNewPasswordChanged event,
    Emitter<ResetPasswordState> emit,
  ) {
    final updatedFormData = state.formData.copyWith(
      newPassword: event.password,
    );

    // Validate new password
    final newPasswordError = _validateNewPassword(event.password);

    // Validate confirm password if it's already filled
    String? confirmPasswordError;
    if (state.formData.confirmPassword.isNotEmpty) {
      confirmPasswordError = _validateConfirmPassword(
        event.password,
        state.formData.confirmPassword,
      );
    }

    emit(
      state.copyWith(
        formData: updatedFormData,
        newPasswordError: newPasswordError,
        confirmPasswordError: confirmPasswordError,
        errorMessage: null,
      ),
    );
  }

  void _onConfirmPasswordChanged(
    ResetPasswordConfirmPasswordChanged event,
    Emitter<ResetPasswordState> emit,
  ) {
    final updatedFormData = state.formData.copyWith(
      confirmPassword: event.password,
    );

    // Validate confirm password
    final confirmPasswordError = _validateConfirmPassword(
      state.formData.newPassword,
      event.password,
    );

    emit(
      state.copyWith(
        formData: updatedFormData,
        confirmPasswordError: confirmPasswordError,
        errorMessage: null,
      ),
    );
  }

  void _onNewPasswordVisibilityToggled(
    ResetPasswordNewPasswordVisibilityToggled event,
    Emitter<ResetPasswordState> emit,
  ) {
    emit(state.copyWith(isNewPasswordVisible: !state.isNewPasswordVisible));
  }

  void _onConfirmPasswordVisibilityToggled(
    ResetPasswordConfirmPasswordVisibilityToggled event,
    Emitter<ResetPasswordState> emit,
  ) {
    emit(
      state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible),
    );
  }

  Future<void> _onSubmitted(
    ResetPasswordSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    // Validate form
    final newPasswordError = _validateNewPassword(state.formData.newPassword);
    final confirmPasswordError = _validateConfirmPassword(
      state.formData.newPassword,
      state.formData.confirmPassword,
    );

    if (newPasswordError != null || confirmPasswordError != null) {
      emit(
        state.copyWith(
          status: ResetPasswordStatus.error,
          newPasswordError: newPasswordError,
          confirmPasswordError: confirmPasswordError,
        ),
      );
      return;
    }

    // Emit loading state
    emit(state.copyWith(status: ResetPasswordStatus.loading));

    // TODO: Implement actual reset password logic
    // For now, simulate success after a delay
    // In real implementation, call repository/use case here
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(status: ResetPasswordStatus.success));
  }

  String? _validateNewPassword(String password) {
    if (password.isEmpty) {
      return null; // Don't show error until user starts typing
    }

    if (password.length < 8) {
      return 'Must be at least 8 character';
    }

    return null;
  }

  String? _validateConfirmPassword(String newPassword, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return null; // Don't show error until user starts typing
    }

    if (newPassword != confirmPassword) {
      return 'Both password must match';
    }

    return null;
  }
}
