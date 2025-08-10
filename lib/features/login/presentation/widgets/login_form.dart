import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_bloc.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_events.dart';
import 'package:e_commerce_app_base/features/login/presentation/blocs/login_states.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

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
            Text(
              l10n.login_email_label,
              style: typography.bodyMediumMedium.copyWith(
                color: colors.neutral100,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: state.formData.email,
              onChanged: (value) {
                context.read<LoginBloc>().add(LoginEmailChanged(value));
              },
              decoration: InputDecoration(
                hintText: l10n.login_email_placeholder,
                hintStyle: TextStyle(color: colors.neutral60),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colors.neutral40),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colors.neutral40),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: colors.primaryHoverIris,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),

            // Password Field
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
                    // TODO: Navigate to forgot password
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
            const SizedBox(height: 8),
            TextFormField(
              initialValue: state.formData.password,
              onChanged: (value) {
                context.read<LoginBloc>().add(LoginPasswordChanged(value));
              },
              obscureText: !state.isPasswordVisible,
              decoration: InputDecoration(
                hintText: l10n.login_password_placeholder,
                hintStyle: TextStyle(color: colors.neutral60),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colors.neutral40),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colors.neutral40),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: colors.primaryHoverIris,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
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
              textInputAction: TextInputAction.done,
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
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: state.isLoading
                    ? null
                    : () {
                        context.read<LoginBloc>().add(LoginSubmitted());
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primaryHoverIris,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: state.isLoading
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : Text(
                        l10n.login_sign_in_button,
                        style: typography.bodyLargeMedium.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
