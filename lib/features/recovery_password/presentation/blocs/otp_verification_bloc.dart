import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/otp_verification_events.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/otp_verification_states.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/models/otp_verification_form_data.dart';

/// BLoC for managing OTP verification state
class OTPVerificationBloc
    extends Bloc<OTPVerificationEvent, OTPVerificationState> {
  OTPVerificationBloc({String email = ''}) 
      : super(OTPVerificationState(
          formData: OTPVerificationFormData(email: email),
        )) {
    on<OTPCodeChanged>(_onCodeChanged);
    on<OTPSubmitted>(_onSubmitted);
    on<OTPResendPressed>(_onResendPressed);
    on<OTPTimerTicked>(_onTimerTicked);

    // Start timer when bloc is created
    _startTimer();
  }

  Timer? _timer;

  void _startTimer() {
    // Cancel existing timer if any
    _timer?.cancel();

    // Start with 60 seconds
    add(const OTPTimerTicked(60));

    // Create timer that ticks every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) {
        timer.cancel();
        add(const OTPTimerTicked(0));
      } else {
        add(OTPTimerTicked(remaining));
      }
    });
  }

  void _onCodeChanged(
    OTPCodeChanged event,
    Emitter<OTPVerificationState> emit,
  ) {
    final updatedFormData = state.formData.copyWith(otpCode: event.code);
    String? errorMessage;
    
    // Clear error if code is being entered and is valid
    if (state.status == OTPVerificationStatus.error && 
        event.code.length == 4 && 
        _isValidOTP(event.code)) {
      errorMessage = null;
    }

    emit(
      state.copyWith(
        formData: updatedFormData,
        errorMessage: errorMessage,
        status: errorMessage == null 
            ? OTPVerificationStatus.active 
            : state.status,
      ),
    );
  }

  void _onSubmitted(
    OTPSubmitted event,
    Emitter<OTPVerificationState> emit,
  ) {
    // Validate OTP
    final validationError = _validateOTP();
    if (validationError != null) {
      emit(
        state.copyWith(
          status: OTPVerificationStatus.error,
          errorMessage: validationError,
        ),
      );
      return;
    }

    // Emit loading state
    emit(state.copyWith(status: OTPVerificationStatus.loading));

    // TODO: Implement actual OTP verification logic
    // For now, simulate success after a delay
    // In real implementation, call repository/use case here
  }

  void _onResendPressed(
    OTPResendPressed event,
    Emitter<OTPVerificationState> emit,
  ) {
    // Only allow resend if enabled
    if (!state.isResendEnabled) {
      return;
    }

    // Reset timer to 60 seconds
    emit(
      state.copyWith(
        isResendEnabled: false,
        remainingSeconds: 60,
        errorMessage: null,
      ),
    );

    // Restart timer
    _startTimer();

    // TODO: Implement actual resend OTP logic
    // In real implementation, call repository/use case here
  }

  void _onTimerTicked(
    OTPTimerTicked event,
    Emitter<OTPVerificationState> emit,
  ) {
    emit(
      state.copyWith(
        remainingSeconds: event.remainingSeconds,
        isResendEnabled: event.remainingSeconds == 0,
      ),
    );
  }

  String? _validateOTP() {
    final code = state.formData.otpCode.trim();

    if (code.isEmpty) {
      return 'OTP code is required';
    }

    if (code.length != 4) {
      return 'OTP code must be 4 digits';
    }

    if (!_isValidOTP(code)) {
      return 'Please enter a valid OTP code';
    }

    return null;
  }

  bool _isValidOTP(String code) {
    // OTP should be 4 digits
    final otpRegex = RegExp(r'^\d{4}$');
    return otpRegex.hasMatch(code);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

