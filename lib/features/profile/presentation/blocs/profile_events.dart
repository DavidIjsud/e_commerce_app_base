import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when the profile tab is first shown
class ProfileInitialized extends ProfileEvent {
  const ProfileInitialized();
}

/// Triggered when the user taps "Sign Out"
class ProfileSignOutRequested extends ProfileEvent {
  const ProfileSignOutRequested();
}
