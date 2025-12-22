import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/reset_password_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/reset_password_states.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/widgets/reset_password_header.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/widgets/reset_password_form.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/widgets/reset_password_success_modal.dart';
import 'package:e_commerce_app_base/injector.dart';

/// Main reset password page
///
/// Displays form to reset user password
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.injector<ResetPasswordBloc>(),
      child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state.isSuccess) {
            // Show success modal bottom sheet
            ResetPasswordSuccessModal.show(context);
          }
        },
        listenWhen: (previous, current) => previous.status != current.status,
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
                  const ResetPasswordHeader(),
                  const SizedBox(height: 32),
                  // Form
                  const ResetPasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


