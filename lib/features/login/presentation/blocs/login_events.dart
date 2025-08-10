import 'package:equatable/equatable.dart';

/// Base class for login events
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

/// Event when email is changed
class LoginEmailChanged extends LoginEvent {
  final String email;

  const LoginEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

/// Event when password is changed
class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

/// Event to toggle password visibility
class LoginPasswordVisibilityToggled extends LoginEvent {}

/// Event to submit login form
class LoginSubmitted extends LoginEvent {}
