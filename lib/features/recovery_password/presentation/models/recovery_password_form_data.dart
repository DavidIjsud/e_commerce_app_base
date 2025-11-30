import 'package:equatable/equatable.dart';

/// Form data model for recovery password
class RecoveryPasswordFormData extends Equatable {
  final String email;

  const RecoveryPasswordFormData({
    this.email = '',
  });

  RecoveryPasswordFormData copyWith({
    String? email,
  }) {
    return RecoveryPasswordFormData(
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [email];
}

