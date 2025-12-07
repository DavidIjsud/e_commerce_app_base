import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/otp_verification_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/otp_verification_events.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/otp_verification_states.dart';
import 'package:e_commerce_app_base/injector.dart';
import 'package:e_commerce_app_base/config/config.dart';

/// Timer and resend button widget for OTP verification
///
/// Displays countdown timer and resend button (disabled during countdown)
class OTPVerificationTimer extends StatelessWidget {
  const OTPVerificationTimer({super.key});

  /// Formats seconds to MM.SS format
  String _formatTimer(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}.${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final config = Get.injector<Config>();
    final colors = config.theme.themeColors;
    final typography = config.theme.typography;

    return BlocBuilder<OTPVerificationBloc, OTPVerificationState>(
      builder: (context, state) {
        return Column(
          children: [
            // "Didn't receive code?" text and Resend button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.otp_verification_didnt_receive,
                  style: typography.bodyMediumRegular.copyWith(
                    color: colors.neutral60,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: state.isResendEnabled
                      ? () {
                          context.read<OTPVerificationBloc>().add(
                                const OTPResendPressed(),
                              );
                        }
                      : null,
                  child: Text(
                    l10n.otp_verification_resend,
                    style: typography.bodyMediumMedium.copyWith(
                      color: state.isResendEnabled
                          ? colors.primaryHoverIris
                          : colors.neutral60,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Timer display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time,
                  size: 16,
                  color: colors.neutral60,
                ),
                const SizedBox(width: 8),
                Text(
                  _formatTimer(state.remainingSeconds),
                  style: typography.bodyMediumRegular.copyWith(
                    color: colors.neutral60,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

