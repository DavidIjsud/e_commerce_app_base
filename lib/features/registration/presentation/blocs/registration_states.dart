import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/registration/presentation/models/models.dart';

/// Enum for registration status
enum RegistrationStatus { initial, loading, success, error }

/// Single state class for registration
class RegistrationState extends Equatable {
  final RegistrationStatus status;
  final RegistrationFormData formData;
  final String? errorMessage;
  final bool isPasswordVisible;

  const RegistrationState({
    this.status = RegistrationStatus.initial,
    this.formData = const RegistrationFormData(),
    this.errorMessage,
    this.isPasswordVisible = false,
  });

  RegistrationState copyWith({
    RegistrationStatus? status,
    RegistrationFormData? formData,
    String? errorMessage,
    bool? isPasswordVisible,
  }) {
    return RegistrationState(
      status: status ?? this.status,
      formData: formData ?? this.formData,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  bool get isInitial => status == RegistrationStatus.initial;
  bool get isLoading => status == RegistrationStatus.loading;
  bool get isSuccess => status == RegistrationStatus.success;
  bool get isError => status == RegistrationStatus.error;

  @override
  List<Object?> get props => [
    status,
    formData,
    errorMessage,
    isPasswordVisible,
  ];
}
