import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_base/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/product_detail_events.dart';
import 'package:e_commerce_app_base/features/home/presentation/blocs/product_detail_states.dart';

/// BLoC for managing product detail page state
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc({required ProductEntity product})
      : super(ProductDetailState(product: product)) {
    on<ProductDetailInitialized>(_onInitialized);
    on<ProductDetailQuantityIncremented>(_onQuantityIncremented);
    on<ProductDetailQuantityDecremented>(_onQuantityDecremented);
    on<ProductDetailFavoriteToggled>(_onFavoriteToggled);
    on<ProductDetailImagePageChanged>(_onImagePageChanged);
  }

  void _onInitialized(
    ProductDetailInitialized event,
    Emitter<ProductDetailState> emit,
  ) {
    // Initialization logic if needed
  }

  void _onQuantityIncremented(
    ProductDetailQuantityIncremented event,
    Emitter<ProductDetailState> emit,
  ) {
    final newQuantity = state.quantity + 1;
    emit(state.copyWith(quantity: newQuantity));
  }

  void _onQuantityDecremented(
    ProductDetailQuantityDecremented event,
    Emitter<ProductDetailState> emit,
  ) {
    if (state.quantity > 1) {
      final newQuantity = state.quantity - 1;
      emit(state.copyWith(quantity: newQuantity));
    }
  }

  void _onFavoriteToggled(
    ProductDetailFavoriteToggled event,
    Emitter<ProductDetailState> emit,
  ) {
    // Create a new product entity with toggled favorite status
    final updatedProduct = ProductEntity(
      id: state.product.id,
      productName: state.product.productName,
      totalInStock: state.product.totalInStock,
      price: state.product.price,
      tags: state.product.tags,
      discountPercentage: state.product.discountPercentage,
      detailOfProduct: state.product.detailOfProduct,
      images: state.product.images,
      isSuspended: state.product.isSuspended,
      category: state.product.category,
      createdAt: state.product.createdAt,
      updatedAt: state.product.updatedAt,
      description: state.product.description,
      isFavorite: !state.product.isFavorite,
    );
    emit(state.copyWith(product: updatedProduct));
  }

  void _onImagePageChanged(
    ProductDetailImagePageChanged event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(state.copyWith(currentImageIndex: event.pageIndex));
  }
}

