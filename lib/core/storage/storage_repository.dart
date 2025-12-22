/// Interfaz abstracta para almacenamiento de datos
/// 
/// Permite diferentes implementaciones (SecureStorage, MockStorage, etc.)
/// y facilita el testing mediante inyección de dependencias
abstract class StorageRepository {
  /// Guarda un valor de forma segura
  /// 
  /// [key] La clave para identificar el valor
  /// [value] El valor a guardar
  Future<void> write(String key, String value);

  /// Lee un valor de forma segura
  /// 
  /// [key] La clave del valor a leer
  /// Retorna el valor si existe, null en caso contrario
  Future<String?> read(String key);

  /// Elimina un valor específico
  /// 
  /// [key] La clave del valor a eliminar
  Future<void> delete(String key);

  /// Elimina todos los valores almacenados
  Future<void> deleteAll();

  /// Verifica si existe una clave
  /// 
  /// [key] La clave a verificar
  /// Retorna true si existe, false en caso contrario
  Future<bool> containsKey(String key);

  /// Lee todos los valores almacenados
  /// 
  /// Retorna un mapa con todas las claves y valores
  Future<Map<String, String>> readAll();
}

