import 'package:equatable/equatable.dart';

/// Base class for OTP verification events
abstract class OTPVerificationEvent extends Equatable {
  const OTPVerificationEvent();

  @override
  List<Object?> get props => [];
}

/// Event when OTP code is changed
class OTPCodeChanged extends OTPVerificationEvent {
  const OTPCodeChanged(this.code);

  final String code;

  @override
  List<Object?> get props => [code];
}

/// Event when OTP form is submitted
class OTPSubmitted extends OTPVerificationEvent {
  const OTPSubmitted();
}

/// Event when resend button is pressed
class OTPResendPressed extends OTPVerificationEvent {
  const OTPResendPressed();
}

/// Event when timer ticks (internal use)
class OTPTimerTicked extends OTPVerificationEvent {
  const OTPTimerTicked(this.remainingSeconds);

  final int remainingSeconds;

  @override
  List<Object?> get props => [remainingSeconds];
}

