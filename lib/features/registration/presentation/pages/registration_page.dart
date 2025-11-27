import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/registration/presentation/blocs/registration_bloc.dart';
import 'package:e_commerce_app_base/features/registration/presentation/widgets/registration_header.dart';
import 'package:e_commerce_app_base/features/registration/presentation/widgets/registration_form.dart';
import 'package:e_commerce_app_base/injector.dart';

/// Main registration page that combines all registration widgets
class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.injector<RegistrationBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                // Header with back button
                const RegistrationHeader(),
                // Registration Form
                const RegistrationForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
