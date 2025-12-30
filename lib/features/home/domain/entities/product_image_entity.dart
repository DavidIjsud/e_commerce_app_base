/// Entidad ProductImage del dominio
///
/// Representa una imagen de producto en la capa de dominio
class ProductImageEntity {
  final String id;
  final String url;
  final String? mongoId; // _id from MongoDB

  const ProductImageEntity({
    required this.id,
    required this.url,
    this.mongoId,
  });
}

