import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/recovery_password_events.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/recovery_password_states.dart';

/// BLoC for managing recovery password state
class RecoveryPasswordBloc
    extends Bloc<RecoveryPasswordEvent, RecoveryPasswordState> {
  RecoveryPasswordBloc() : super(const RecoveryPasswordState()) {
    on<RecoveryPasswordEmailChanged>(_onEmailChanged);
    on<RecoveryPasswordSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    RecoveryPasswordEmailChanged event,
    Emitter<RecoveryPasswordState> emit,
  ) {
    emit(
      state.copyWith(
        formData: state.formData.copyWith(email: event.email),
        errorMessage: null,
      ),
    );
  }

  Future<void> _onSubmitted(
    RecoveryPasswordSubmitted event,
    Emitter<RecoveryPasswordState> emit,
  ) async {
    // Validate form
    final validationError = _validateForm();
    if (validationError != null) {
      emit(
        state.copyWith(
          status: RecoveryPasswordStatus.error,
          errorMessage: validationError,
        ),
      );
      return;
    }

    // Emit loading state
    emit(state.copyWith(status: RecoveryPasswordStatus.loading));

    // TODO: Implement actual recovery password logic
    // For now, simulate success after a delay
    // In real implementation, call repository/use case here
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(status: RecoveryPasswordStatus.success));
  }

  String? _validateForm() {
    final email = state.formData.email.trim();

    if (email.isEmpty) {
      return 'Email is required';
    }

    // Email format validation
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }

    return null;
  }
}
