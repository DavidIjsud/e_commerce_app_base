import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/features/profile/presentation/blocs/blocs.dart';
import 'package:e_commerce_app_base/features/profile/presentation/widgets/widgets.dart';

/// Entry-point widget for the Profile tab.
///
/// Dispatches [ProfileInitialized] on first mount and renders the
/// profile settings screen.
class ProfilePageContent extends StatefulWidget {
  const ProfilePageContent({super.key});

  @override
  State<ProfilePageContent> createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePageContent> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileInitialized());
  }

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // ── Title ──────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Profile Settings',
                textAlign: TextAlign.center,
                style: typography.heading5Bold.copyWith(
                  color: colors.neutral100,
                ),
              ),
            ),

            const SizedBox(height: 28),

            // ── Avatar + name + email ─────────────────────────────────────
            const ProfileAvatarHeader(),

            const SizedBox(height: 28),

            Divider(color: colors.neutral30, thickness: 1),

            const SizedBox(height: 8),

            // ── Profile section ───────────────────────────────────────────
            ProfileMenuSection(
              title: 'Profile',
              items: [
                ProfileMenuItem(
                  icon: Icons.person_outline,
                  label: 'Personal Data',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.credit_card_outlined,
                  label: 'Extra Card',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 8),

            Divider(color: colors.neutral30, thickness: 1),

            const SizedBox(height: 8),

            // ── Support section ───────────────────────────────────────────
            ProfileMenuSection(
              title: 'Support',
              items: [
                ProfileMenuItem(
                  icon: Icons.info_outline,
                  label: 'Help Center',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.delete_outline,
                  label: 'Request Account Deletion',
                  onTap: () {},
                  isDestructive: true,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ── Sign Out ──────────────────────────────────────────────────
            const ProfileSignOutButton(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
