import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/reset_password_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/reset_password_events.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/reset_password_states.dart';
import 'package:e_commerce_app_base/core/widgets/app_text_form_field.dart';
import 'package:e_commerce_app_base/core/widgets/primary_button.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Form widget for reset password page
///
/// Displays password fields and submit button
class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main title
            Text(
              l10n.reset_password_title,
              style: typography.heading1Bold
                  .copyWith(color: colors.neutral100)
                  .copyWith(fontSize: 32),
            ),
            const SizedBox(height: 8),
            // Instructional text
            Text(
              l10n.reset_password_instruction,
              style: typography.bodyMediumRegular.copyWith(
                color: colors.neutral60,
              ),
            ),
            const SizedBox(height: 32),
            // New Password Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormField(
                  label: l10n.reset_password_new_password_label,
                  initialValue: state.formData.newPassword,
                  onChanged: (value) {
                    context.read<ResetPasswordBloc>().add(
                      ResetPasswordNewPasswordChanged(value),
                    );
                  },
                  obscureText: !state.isNewPasswordVisible,
                  textInputAction: TextInputAction.next,
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<ResetPasswordBloc>().add(
                        const ResetPasswordNewPasswordVisibilityToggled(),
                      );
                    },
                    icon: Icon(
                      state.isNewPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: colors.neutral60,
                    ),
                  ),
                ),
                if (state.newPasswordError != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    state.newPasswordError!,
                    style: typography.bodySmallRegular.copyWith(
                      color: colors.neutral60,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 20),
            // Confirm Password Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormField(
                  label: l10n.reset_password_confirm_password_label,
                  initialValue: state.formData.confirmPassword,
                  onChanged: (value) {
                    context.read<ResetPasswordBloc>().add(
                      ResetPasswordConfirmPasswordChanged(value),
                    );
                  },
                  obscureText: !state.isConfirmPasswordVisible,
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<ResetPasswordBloc>().add(
                        const ResetPasswordConfirmPasswordVisibilityToggled(),
                      );
                    },
                    icon: Icon(
                      state.isConfirmPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: colors.neutral60,
                    ),
                  ),
                ),
                if (state.confirmPasswordError != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    state.confirmPasswordError!,
                    style: typography.bodySmallRegular.copyWith(
                      color: colors.neutral60,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 32),
            // Verify Account Button
            PrimaryButton(
              text: l10n.reset_password_verify_button,
              onPressed:
                  state.formData.newPassword.isNotEmpty &&
                      state.formData.confirmPassword.isNotEmpty &&
                      state.newPasswordError == null &&
                      state.confirmPasswordError == null
                  ? () {
                      context.read<ResetPasswordBloc>().add(
                        const ResetPasswordSubmitted(),
                      );
                    }
                  : null,
              isLoading: state.isLoading,
            ),
          ],
        );
      },
    );
  }
}
