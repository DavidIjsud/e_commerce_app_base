import 'package:equatable/equatable.dart';

/// Base class for recovery password events
abstract class RecoveryPasswordEvent extends Equatable {
  const RecoveryPasswordEvent();

  @override
  List<Object?> get props => [];
}

/// Event when email is changed
class RecoveryPasswordEmailChanged extends RecoveryPasswordEvent {
  final String email;

  const RecoveryPasswordEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

/// Event to submit recovery password form
class RecoveryPasswordSubmitted extends RecoveryPasswordEvent {}

