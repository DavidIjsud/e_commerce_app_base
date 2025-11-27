import 'package:equatable/equatable.dart';

/// Form data model for registration
class RegistrationFormData extends Equatable {
  final String email;
  final String username;
  final String password;
  final bool agreedToTerms;

  const RegistrationFormData({
    this.email = '',
    this.username = '',
    this.password = '',
    this.agreedToTerms = false,
  });

  RegistrationFormData copyWith({
    String? email,
    String? username,
    String? password,
    bool? agreedToTerms,
  }) {
    return RegistrationFormData(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
    );
  }

  @override
  List<Object?> get props => [email, username, password, agreedToTerms];
}
