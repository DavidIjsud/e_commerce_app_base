import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_bloc.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_events.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_states.dart';
import 'package:e_commerce_app_base/core/widgets/widgets.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';
import 'package:e_commerce_app_base/features/registration/presentation/widgets/terms_checkbox.dart';

/// Registration form widget with email, username, password inputs and terms checkbox
class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Field
            AppTextFormField(
              label: l10n.registration_email_label,
              hintText: l10n.registration_email_placeholder,
              initialValue: state.formData.email,
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                  RegistrationEmailChanged(value),
                );
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),

            // Username Field
            AppTextFormField(
              label: l10n.registration_username_label,
              hintText: l10n.registration_username_placeholder,
              initialValue: state.formData.username,
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                  RegistrationUsernameChanged(value),
                );
              },
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),

            // Password Field
            AppTextFormField(
              label: l10n.registration_password_label,
              hintText: l10n.registration_password_placeholder,
              initialValue: state.formData.password,
              onChanged: (value) {
                context.read<RegistrationBloc>().add(
                  RegistrationPasswordChanged(value),
                );
              },
              obscureText: !state.isPasswordVisible,
              textInputAction: TextInputAction.done,
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<RegistrationBloc>().add(
                    RegistrationPasswordVisibilityToggled(),
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
            const SizedBox(height: 24),

            // Terms Checkbox
            const TermsCheckbox(),
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

            // Register Button
            PrimaryButton(
              text: l10n.registration_register_button,
              onPressed: () {
                context.read<RegistrationBloc>().add(
                  RegistrationSubmitted(),
                );
              },
              isLoading: state.isLoading,
            ),
          ],
        );
      },
    );
  }
}

