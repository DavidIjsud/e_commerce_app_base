import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:e_commerce_app_base/features/login/presentation/pages/login_page.dart';
import 'package:e_commerce_app_base/features/registration/presentation/pages/registration_page.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/pages/recovery_password_page.dart';

/// Application router configuration
///
/// Defines all routes in the application using go_router
class AppRouter {
  /// Route paths
  static const String onboarding = '/';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String recoveryPassword = '/recovery-password';

  /// Create and configure the GoRouter instance
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: onboarding,
      routes: [
        GoRoute(
          path: onboarding,
          name: 'onboarding',
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: login,
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: registration,
          name: 'registration',
          builder: (context, state) => const RegistrationPage(),
        ),
        GoRoute(
          path: recoveryPassword,
          name: 'recovery-password',
          builder: (context, state) => const RecoveryPasswordPage(),
        ),
      ],
    );
  }
}
