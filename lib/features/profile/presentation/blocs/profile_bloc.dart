import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/profile/domain/entities/entities.dart';
import 'package:e_commerce_app_base/features/profile/presentation/blocs/profile_events.dart';
import 'package:e_commerce_app_base/features/profile/presentation/blocs/profile_states.dart';

/// BLoC for managing the user profile state.
///
/// Uses dummy data for now. Designed to be replaced with real API calls.
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ProfileInitialized>(_onInitialized);
    on<ProfileSignOutRequested>(_onSignOutRequested);
  }

  void _onInitialized(ProfileInitialized event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      status: ProfileStatus.loaded,
      profile: const ProfileEntity(
        id: 'user_1',
        name: 'Albert Stevano Bajefski',
        email: 'Albertstevano@gmail.com',
      ),
    ));
  }

  void _onSignOutRequested(
    ProfileSignOutRequested event,
    Emitter<ProfileState> emit,
  ) {
    // TODO: Clear tokens and navigate to login when backend is integrated
    emit(state.copyWith(status: ProfileStatus.signedOut));
  }
}
