import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_bloc.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_events.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_states.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Terms and Privacy Policy checkbox widget
class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: state.formData.agreedToTerms,
                onChanged: (value) {
                  context.read<RegistrationBloc>().add(
                    RegistrationTermsToggled(value ?? false),
                  );
                },
                activeColor: colors.primaryHoverIris,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: typography.bodyMediumRegular.copyWith(
                    color: colors.neutral100,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(text: l10n.registration_terms_prefix),
                    TextSpan(
                      text: l10n.registration_terms_of_service,
                      style: typography.bodyMediumMedium.copyWith(
                        color: colors.primaryHoverIris,
                        fontSize: 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO: Navigate to Terms of Service page
                        },
                    ),
                    TextSpan(text: l10n.registration_terms_and),
                    TextSpan(
                      text: l10n.registration_privacy_policy,
                      style: typography.bodyMediumMedium.copyWith(
                        color: colors.primaryHoverIris,
                        fontSize: 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO: Navigate to Privacy Policy page
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

