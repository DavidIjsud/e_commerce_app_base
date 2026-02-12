import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_base/features/profile/domain/entities/entities.dart';

enum ProfileStatus { initial, loaded, signedOut }

class ProfileState extends Equatable {
  final ProfileStatus status;
  final ProfileEntity? profile;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.profile,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    ProfileEntity? profile,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [status, profile];
}
