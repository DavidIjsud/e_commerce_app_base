import 'package:equatable/equatable.dart';

/// Base class for reset password events
abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object?> get props => [];
}

/// Event when new password is changed
class ResetPasswordNewPasswordChanged extends ResetPasswordEvent {
  const ResetPasswordNewPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

/// Event when confirm password is changed
class ResetPasswordConfirmPasswordChanged extends ResetPasswordEvent {
  const ResetPasswordConfirmPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

/// Event when new password visibility is toggled
class ResetPasswordNewPasswordVisibilityToggled extends ResetPasswordEvent {
  const ResetPasswordNewPasswordVisibilityToggled();
}

/// Event when confirm password visibility is toggled
class ResetPasswordConfirmPasswordVisibilityToggled extends ResetPasswordEvent {
  const ResetPasswordConfirmPasswordVisibilityToggled();
}

/// Event when form is submitted
class ResetPasswordSubmitted extends ResetPasswordEvent {
  const ResetPasswordSubmitted();
}
