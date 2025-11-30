import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_bloc.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_events.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_states.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';
import 'package:e_commerce_app_base/core/widgets/widgets.dart';
import 'package:e_commerce_app_base/navigation/app_router.dart';

/// Login form widget with email and password inputs
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Field
            AppTextFormField(
              label: l10n.login_email_label,
              hintText: l10n.login_email_placeholder,
              initialValue: state.formData.email,
              onChanged: (value) {
                context.read<LoginBloc>().add(LoginEmailChanged(value));
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),

            // Password Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.login_password_label,
                      style: typography.bodyMediumMedium.copyWith(
                        color: colors.neutral100,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(AppRouter.recoveryPassword);
                      },
                      child: Text(
                        l10n.login_forgot_password,
                        style: typography.bodyMediumMedium.copyWith(
                          color: colors.primaryHoverIris,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                AppTextFormField(
                  hintText: l10n.login_password_placeholder,
                  initialValue: state.formData.password,
                  onChanged: (value) {
                    context.read<LoginBloc>().add(LoginPasswordChanged(value));
                  },
                  obscureText: !state.isPasswordVisible,
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                        LoginPasswordVisibilityToggled(),
                      );
                    },
                    icon: Icon(
                      state.isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: colors.neutral60,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Error Message
            if (state.isError && state.errorMessage != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colors.errorSurfaceRed,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: colors.errorBorderRed),
                ),
                child: Text(
                  state.errorMessage!,
                  style: typography.bodyMediumRegular.copyWith(
                    color: colors.errorMainRed,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            if (state.isError && state.errorMessage != null)
              const SizedBox(height: 20),

            // Sign In Button
            PrimaryButton(
              text: l10n.login_sign_in_button,
              onPressed: () {
                context.read<LoginBloc>().add(LoginSubmitted());
              },
              isLoading: state.isLoading,
            ),
          ],
        );
      },
    );
  }
}
