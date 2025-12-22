/// Claves para almacenamiento seguro
/// 
/// Centraliza todas las claves usadas en el almacenamiento
/// para evitar errores de tipeo y facilitar el mantenimiento
class StorageKeys {
  // Tokens de autenticación
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  
  // Información del usuario
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userName = 'user_name';
  
  // Preferencias de la app
  static const String onboardingCompleted = 'onboarding_completed';
  static const String language = 'language';
  static const String theme = 'theme';
}

