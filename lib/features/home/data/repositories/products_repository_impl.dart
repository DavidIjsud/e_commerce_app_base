import 'package:e_commerce_app_base/core/network/exceptions/exceptions.dart';
import 'package:e_commerce_app_base/features/home/data/datasources/products_remote_datasource.dart';
import 'package:e_commerce_app_base/features/home/domain/domain.dart';

/// Implementación del repositorio de productos
/// 
/// Conecta la capa de dominio con la capa de datos
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    try {
      final products = await remoteDataSource.getAllProducts();

      // Convertir modelos a entidades del dominio
      return products.map((model) => model.toEntity()).toList();
    } on ApiException {
      // Re-lanzar excepciones de API sin modificar
      rethrow;
    } catch (e) {
      // Cualquier otra excepción no esperada
      throw ServerException(
        'An unexpected error occurred: ${e.toString()}',
        null,
      );
    }
  }
}

