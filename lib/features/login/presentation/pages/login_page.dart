import 'package:e_commerce_app_base/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_bloc.dart';
import 'package:e_commerce_app_base/features/login/presentation/widgets/login_header.dart';
import 'package:e_commerce_app_base/features/login/presentation/widgets/login_form.dart';
import 'package:e_commerce_app_base/features/login/presentation/widgets/social_login_buttons.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

/// Main login page that combines all login widgets
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => Get.injector<LoginBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // Header
                const LoginHeader(),

                // Login Form
                const LoginForm(),

                const SizedBox(height: 32),

                // Social Login
                const SocialLoginButtons(),

                const SizedBox(height: 20),

                // Register Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.login_register_text,
                        style: typography.bodyMediumRegular.copyWith(
                          color: colors.neutral60,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          context.go(AppRouter.registration);
                        },
                        child: Text(
                          l10n.login_register_link,
                          style: typography.bodyMediumMedium.copyWith(
                            color: colors.primaryHoverIris,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
