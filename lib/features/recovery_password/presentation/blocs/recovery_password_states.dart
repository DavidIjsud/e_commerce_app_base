import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/models/models.dart';

/// Enum for recovery password status
enum RecoveryPasswordStatus { initial, loading, success, error }

/// Single state class for recovery password
class RecoveryPasswordState extends Equatable {
  final RecoveryPasswordStatus status;
  final RecoveryPasswordFormData formData;
  final String? errorMessage;

  const RecoveryPasswordState({
    this.status = RecoveryPasswordStatus.initial,
    this.formData = const RecoveryPasswordFormData(),
    this.errorMessage,
  });

  RecoveryPasswordState copyWith({
    RecoveryPasswordStatus? status,
    RecoveryPasswordFormData? formData,
    String? errorMessage,
  }) {
    return RecoveryPasswordState(
      status: status ?? this.status,
      formData: formData ?? this.formData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isInitial => status == RecoveryPasswordStatus.initial;
  bool get isLoading => status == RecoveryPasswordStatus.loading;
  bool get isSuccess => status == RecoveryPasswordStatus.success;
  bool get isError => status == RecoveryPasswordStatus.error;

  @override
  List<Object?> get props => [
    status,
    formData,
    errorMessage,
  ];
}

