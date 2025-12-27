import 'package:dio/dio.dart';
import 'package:e_commerce_app_base/core/network/exceptions/exceptions.dart';
import 'package:e_commerce_app_base/features/home/data/models/product_model.dart';

/// DataSource remoto para operaciones de productos
abstract class ProductsRemoteDataSource {
  /// Obtiene todos los productos
  Future<List<ProductModel>> getAllProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio dio;

  ProductsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await dio.get('/api/v1/products/all');

      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      // El ErrorInterceptor ya transformó la excepción a ApiException
      // y la colocó en e.error
      if (e.error is ApiException) {
        throw e.error as ApiException;
      }

      // Si por alguna razón no hay ApiException, lanzamos una genérica
      throw ServerException(
        e.message ?? 'An error occurred while fetching products',
        e.response?.statusCode,
      );
    } catch (e) {
      // Cualquier otra excepción no esperada
      throw ServerException(
        'An unexpected error occurred: ${e.toString()}',
        null,
      );
    }
  }
}

