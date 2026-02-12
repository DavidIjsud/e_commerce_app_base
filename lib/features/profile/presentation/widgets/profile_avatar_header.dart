import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/profile/presentation/blocs/blocs.dart';

/// Avatar, name, and email section at the top of the profile page
class ProfileAvatarHeader extends StatelessWidget {
  const ProfileAvatarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final profile = state.profile;

        return Column(
          children: [
            // Avatar with camera badge
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.neutral30,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 48,
                    color: colors.neutral60,
                  ),
                ),
                // Camera badge
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.primaryHoverIris,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            // Name
            Text(
              profile?.name ?? '',
              style: typography.heading5Bold.copyWith(
                color: colors.neutral100,
              ),
            ),
            const SizedBox(height: 4),
            // Email
            Text(
              profile?.email ?? '',
              style: typography.bodyMediumRegular.copyWith(
                color: colors.neutral60,
              ),
            ),
          ],
        );
      },
    );
  }
}
