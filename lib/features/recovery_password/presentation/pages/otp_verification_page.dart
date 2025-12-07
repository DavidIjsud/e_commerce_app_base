import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/otp_verification_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/otp_verification_events.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/otp_verification_states.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/widgets/otp_verification_header.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/widgets/otp_verification_content.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/widgets/otp_verification_timer.dart';
import 'package:e_commerce_app_base/core/widgets/primary_button.dart';
import 'package:e_commerce_app_base/l10n/app_localizations.dart';

/// Main OTP verification page
///
/// Displays OTP input fields, timer, and resend functionality
class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({
    super.key,
    this.email = '',
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) {
        // Get email from route parameters or use provided email
        final routeEmail = GoRouterState.of(context).uri.queryParameters['email'] ?? '';
        final finalEmail = email.isNotEmpty ? email : routeEmail;
        return OTPVerificationBloc(email: finalEmail);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocListener<OTPVerificationBloc, OTPVerificationState>(
            listener: (context, state) {
              if (state.status == OTPVerificationStatus.completed) {
                // TODO: Navigate to next page (e.g., new password page)
                // For now, just pop
                context.pop();
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  // Header
                  const OTPVerificationHeader(),
                  const SizedBox(height: 32),
                  // Content
                  BlocBuilder<OTPVerificationBloc, OTPVerificationState>(
                    builder: (context, state) {
                      return OTPVerificationContent(
                        email: email.isNotEmpty ? email : state.formData.email,
                        otpCode: state.formData.otpCode,
                        onCodeChanged: (code) {
                          context.read<OTPVerificationBloc>().add(
                                OTPCodeChanged(code),
                              );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  // Timer and Resend
                  const OTPVerificationTimer(),
                  const SizedBox(height: 32),
                  // Continue button
                  BlocBuilder<OTPVerificationBloc, OTPVerificationState>(
                    builder: (context, state) {
                      return PrimaryButton(
                        text: l10n.otp_verification_continue_button,
                        onPressed: state.formData.otpCode.length == 4
                            ? () {
                                context.read<OTPVerificationBloc>().add(
                                      const OTPSubmitted(),
                                    );
                              }
                            : null,
                        isLoading: state.status == OTPVerificationStatus.loading,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

