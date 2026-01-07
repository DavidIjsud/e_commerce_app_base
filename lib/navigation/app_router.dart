import 'package:go_router/go_router.dart';
import 'package:e_commerce_app_base/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:e_commerce_app_base/features/login/presentation/pages/login_page.dart';
import 'package:e_commerce_app_base/features/registration/presentation/pages/registration_page.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/pages/recovery_password_page.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/pages/otp_verification_page.dart';
import 'package:e_commerce_app_base/features/recovery_password/presentation/pages/reset_password_page.dart';
import 'package:e_commerce_app_base/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce_app_base/features/home/presentation/pages/product_detail_page.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_base/features/notifications/presentation/pages/notifications_page.dart';

/// Application router configuration
///
/// Defines all routes in the application using go_router
class AppRouter {
  /// Route paths
  static const String onboarding = '/';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String recoveryPassword = '/recovery-password';
  static const String otpVerification = '/otp-verification';
  static const String resetPassword = '/reset-password';
  static const String home = '/home';
  static const String productDetail = '/product-detail';
  static const String notifications = '/notifications';

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
        GoRoute(
          path: otpVerification,
          name: 'otp-verification',
          builder: (context, state) {
            final email = state.uri.queryParameters['email'] ?? '';
            return OTPVerificationPage(email: email);
          },
        ),
        GoRoute(
          path: resetPassword,
          name: 'reset-password',
          builder: (context, state) => const ResetPasswordPage(),
        ),
        GoRoute(
          path: home,
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: productDetail,
          name: 'product-detail',
          builder: (context, state) {
            final product = state.extra as ProductEntity?;
            if (product == null) {
              // Fallback: redirect to home if no product provided
              return const HomePage();
            }
            return ProductDetailPage(product: product);
          },
        ),
        GoRoute(
          path: notifications,
          name: 'notifications',
          builder: (context, state) => const NotificationsPage(),
        ),
      ],
    );
  }
}
