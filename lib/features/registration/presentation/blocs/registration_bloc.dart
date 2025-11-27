import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_events.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_states.dart';

/// BLoC for managing registration state
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationState()) {
    on<RegistrationEmailChanged>(_onEmailChanged);
    on<RegistrationUsernameChanged>(_onUsernameChanged);
    on<RegistrationPasswordChanged>(_onPasswordChanged);
    on<RegistrationPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<RegistrationTermsToggled>(_onTermsToggled);
    on<RegistrationSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    RegistrationEmailChanged event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        formData: state.formData.copyWith(email: event.email),
        errorMessage: null,
      ),
    );
  }

  void _onUsernameChanged(
    RegistrationUsernameChanged event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        formData: state.formData.copyWith(username: event.username),
        errorMessage: null,
      ),
    );
  }

  void _onPasswordChanged(
    RegistrationPasswordChanged event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        formData: state.formData.copyWith(password: event.password),
        errorMessage: null,
      ),
    );
  }

  void _onPasswordVisibilityToggled(
    RegistrationPasswordVisibilityToggled event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onTermsToggled(
    RegistrationTermsToggled event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        formData: state.formData.copyWith(agreedToTerms: event.agreed),
        errorMessage: null,
      ),
    );
  }

  void _onSubmitted(
    RegistrationSubmitted event,
    Emitter<RegistrationState> emit,
  ) {
    // Validate form
    final validationError = _validateForm();
    if (validationError != null) {
      emit(
        state.copyWith(
          status: RegistrationStatus.error,
          errorMessage: validationError,
        ),
      );
      return;
    }

    // Emit loading state
    emit(state.copyWith(status: RegistrationStatus.loading));

    // TODO: Implement actual registration logic
    // For now, simulate success after a delay
    // In real implementation, call repository/use case here
  }

  String? _validateForm() {
    final email = state.formData.email.trim();
    final username = state.formData.username.trim();
    final password = state.formData.password;

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

    if (username.isEmpty) {
      return 'Username is required';
    }

    if (password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (!state.formData.agreedToTerms) {
      return 'You must agree to the Terms of Service and Privacy Policy';
    }

    return null;
  }
}
