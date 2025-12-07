import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/models/otp_verification_form_data.dart';

/// Status enum for OTP verification
enum OTPVerificationStatus {
  initial,
  loading,
  active,
  completed,
  error,
}

/// State for OTP verification
class OTPVerificationState extends Equatable {
  const OTPVerificationState({
    this.status = OTPVerificationStatus.initial,
    this.formData = const OTPVerificationFormData(),
    this.remainingSeconds = 60,
    this.isResendEnabled = false,
    this.errorMessage,
  });

  final OTPVerificationStatus status;
  final OTPVerificationFormData formData;
  final int remainingSeconds;
  final bool isResendEnabled;
  final String? errorMessage;

  OTPVerificationState copyWith({
    OTPVerificationStatus? status,
    OTPVerificationFormData? formData,
    int? remainingSeconds,
    bool? isResendEnabled,
    String? errorMessage,
  }) {
    return OTPVerificationState(
      status: status ?? this.status,
      formData: formData ?? this.formData,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isResendEnabled: isResendEnabled ?? this.isResendEnabled,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        formData,
        remainingSeconds,
        isResendEnabled,
        errorMessage,
      ];
}

