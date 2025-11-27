import 'package:equatable/equatable.dart';

/// Base class for registration events
abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

/// Event when email is changed
class RegistrationEmailChanged extends RegistrationEvent {
  final String email;

  const RegistrationEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

/// Event when username is changed
class RegistrationUsernameChanged extends RegistrationEvent {
  final String username;

  const RegistrationUsernameChanged(this.username);

  @override
  List<Object?> get props => [username];
}

/// Event when password is changed
class RegistrationPasswordChanged extends RegistrationEvent {
  final String password;

  const RegistrationPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

/// Event to toggle password visibility
class RegistrationPasswordVisibilityToggled extends RegistrationEvent {}

/// Event to toggle terms agreement
class RegistrationTermsToggled extends RegistrationEvent {
  final bool agreed;

  const RegistrationTermsToggled(this.agreed);

  @override
  List<Object?> get props => [agreed];
}

/// Event to submit registration form
class RegistrationSubmitted extends RegistrationEvent {}

