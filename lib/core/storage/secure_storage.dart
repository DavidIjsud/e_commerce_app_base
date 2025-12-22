import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:e_commerce_app_base/core/storage/storage_repository.dart';

/// Implementación de StorageRepository usando Flutter Secure Storage
/// 
/// Usa Flutter Secure Storage que utiliza:
/// - iOS: Keychain
/// - Android: Keystore
class SecureStorage implements StorageRepository {
  static const _storage = FlutterSecureStorage(
    // Opciones de seguridad para Android
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    // Opciones de seguridad para iOS
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  @override
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  @override
  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  @override
  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }
}

