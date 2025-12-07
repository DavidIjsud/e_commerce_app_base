import 'package:equatable/equatable.dart';

/// Data model for OTP verification form
class OTPVerificationFormData extends Equatable {
  const OTPVerificationFormData({
    this.otpCode = '',
    this.email = '',
  });

  final String otpCode;
  final String email;

  OTPVerificationFormData copyWith({
    String? otpCode,
    String? email,
  }) {
    return OTPVerificationFormData(
      otpCode: otpCode ?? this.otpCode,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [otpCode, email];

  @override
  String toString() => 'OTPVerificationFormData(otpCode: $otpCode, email: $email)';
}

