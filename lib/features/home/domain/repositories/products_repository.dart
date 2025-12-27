import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';

/// Repositorio abstracto para operaciones de productos
/// 
/// Define el contrato para la capa de datos
abstract class ProductsRepository {
  /// Obtiene todos los productos
  /// 
  /// Retorna una lista de [ProductEntity]
  /// Lanza una excepción si la petición falla
  Future<List<ProductEntity>> getAllProducts();
}

