import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_bloc.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/home_states.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Bottom navigation bar widget
///
/// Displays 4 tabs: Home, Shopping Bag, Chat, Profile
class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: state.currentBottomNavTab,
            onTap: (index) {
              context.read<HomeBloc>().add(
                    BottomNavTabChanged(index),
                  );
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: colors.primaryHoverIris,
            unselectedItemColor: colors.neutral60,
            selectedLabelStyle: typography.bodySmallMedium,
            unselectedLabelStyle: typography.bodySmallRegular,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: l10n.home_bottom_nav_home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_bag_outlined),
                label: l10n.home_bottom_nav_shopping,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.chat_bubble_outline),
                label: l10n.home_bottom_nav_chat,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                label: l10n.home_bottom_nav_profile,
              ),
            ],
          ),
        );
      },
    );
  }
}

