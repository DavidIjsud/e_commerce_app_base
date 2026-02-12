import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/profile/presentation/blocs/blocs.dart';

/// Outlined "Sign Out" button at the bottom of the profile page
class ProfileSignOutButton extends StatelessWidget {
  const ProfileSignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: OutlinedButton(
        onPressed: () {
          context.read<ProfileBloc>().add(const ProfileSignOutRequested());
        },
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          side: BorderSide(color: colors.neutral40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout,
              color: colors.errorMainRed,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              'Sign Out',
              style: typography.bodyLargeBold.copyWith(
                color: colors.errorMainRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
