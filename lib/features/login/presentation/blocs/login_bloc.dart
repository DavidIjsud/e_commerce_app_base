import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/core/network/exceptions/exceptions.dart';
import 'package:e_commerce_app_base/features/login/domain/domain.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_events.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_states.dart';

/// BLoC for managing login state and business logic
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final updatedFormData = state.formData.copyWith(email: event.email);

    // Clear error if email becomes valid
    String? errorMessage;
    if (state.isError && event.email.isNotEmpty && _isValidEmail(event.email)) {
      errorMessage = null;
    }

    emit(
      state.copyWith(
        formData: updatedFormData,
        errorMessage: errorMessage,
        status: errorMessage == null ? LoginStatus.initial : state.status,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final updatedFormData = state.formData.copyWith(password: event.password);
    emit(state.copyWith(formData: updatedFormData));
  }

  void _onPasswordVisibilityToggled(
    LoginPasswordVisibilityToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final validationResult = _validateForm();
    if (validationResult != null) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: validationResult,
        ),
      );
      return;
    }

    emit(state.copyWith(status: LoginStatus.loading));

    try {
      await loginRepository.login(
        email: state.formData.email,
        password: state.formData.password.isEmpty
            ? null
            : state.formData.password,
      );

      // Login exitoso - el token ya fue guardado en SecureStorage por el repositorio
      emit(state.copyWith(status: LoginStatus.success, errorMessage: null));
    } on ServerException catch (e) {
      // Error del servidor (404, 500, etc.)
      emit(state.copyWith(status: LoginStatus.error, errorMessage: e.message));
    } on NetworkException catch (e) {
      // Error de red (sin internet, timeout, etc.)
      emit(state.copyWith(status: LoginStatus.error, errorMessage: e.message));
    } catch (e) {
      // Cualquier otro error no esperado
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: 'An unexpected error occurred. Please try again.',
        ),
      );
    }
  }

  String? _validateForm() {
    if (state.formData.email.isEmpty) {
      return 'Please enter your email address';
    }

    if (!_isValidEmail(state.formData.email)) {
      return 'Please enter a valid email address';
    }

    // Password es opcional si se usa login con provider (Google, Facebook, etc.)
    // Solo validamos password si el usuario está intentando hacer login con email/password
    // Por ahora, validamos que haya password, pero esto se puede ajustar según la UI
    // Si el usuario selecciona "Login with Google", no se requiere password
    // if (state.formData.password.isEmpty) {
    //   return 'Please enter your password';
    // }

    return null; // Form is valid
  }

  bool _isValidEmail(String email) {
    // Basic email validation using RegExp
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(email);
  }
}
