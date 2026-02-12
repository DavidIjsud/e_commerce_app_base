import 'package:equatable/equatable.dart';

/// Represents the current user's profile data
class ProfileEntity extends Equatable {
  final String id;
  final String name;
  final String email;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
}
