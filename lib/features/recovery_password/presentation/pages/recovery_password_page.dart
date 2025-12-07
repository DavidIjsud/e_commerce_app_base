import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/recovery_password_bloc.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/blocs/recovery_password_states.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/widgets/recovery_password_header.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/widgets/recovery_password_form.dart';
import 'package:e_commerce_app_base/navigation/app_router.dart';
import 'package:e_commerce_app_base/injector.dart';

/// Main recovery password page that combines all recovery password widgets
class RecoveryPasswordPage extends StatelessWidget {
  const RecoveryPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.injector<RecoveryPasswordBloc>(),
      child: BlocListener<RecoveryPasswordBloc, RecoveryPasswordState>(
        listener: (context, state) {
          if (state.isSuccess) {
            // Navigate to OTP verification page with email
            context.push(
              '${AppRouter.otpVerification}?email=${Uri.encodeComponent(state.formData.email)}',
            );
          }
        },
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
                  const RecoveryPasswordHeader(),
                  // Recovery Password Form
                  const RecoveryPasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

