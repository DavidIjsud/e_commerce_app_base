import 'package:equatable/equatable.dart';

/// Data class for login form
class LoginFormData extends Equatable {
  final String email;
  final String password;

  const LoginFormData({this.email = '', this.password = ''});

  LoginFormData copyWith({String? email, String? password}) {
    return LoginFormData(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [email, password];
}
