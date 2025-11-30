import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/recovery_password_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/recovery_password_events.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/recovery_password_states.dart';
import 'package:e_commerce_app_base/core/widgets/widgets.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Recovery password form widget with email input
class RecoveryPasswordForm extends StatelessWidget {
  const RecoveryPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<RecoveryPasswordBloc, RecoveryPasswordState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Field
            AppTextFormField(
              label: l10n.recovery_password_email_label,
              hintText: l10n.recovery_password_email_placeholder,
              initialValue: state.formData.email,
              onChanged: (value) {
                context.read<RecoveryPasswordBloc>().add(
                  RecoveryPasswordEmailChanged(value),
                );
              },
              keyboardType: TextInputType.emailAddress,
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

            // Continue Button
            PrimaryButton(
              text: l10n.recovery_password_continue_button,
              onPressed: () {
                context.read<RecoveryPasswordBloc>().add(
                  RecoveryPasswordSubmitted(),
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

