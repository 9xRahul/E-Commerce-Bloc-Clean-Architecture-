part of 'products_bloc.dart';

@immutable
sealed class ProductsState {
  final int imageIndex;

  ProductsState({this.imageIndex = 0});
}

class ProductsInitial extends ProductsState {
  ProductsInitial() : super(imageIndex: 0);
}

class ProductsLoading extends ProductsState {
  ProductsLoading({int imageIndex = 0}) : super(imageIndex: imageIndex);
}

class ProductsLoadSuccess extends ProductsState {
  final List<ProductEntity> products;

  ProductsLoadSuccess({required this.products, int imageIndex = 0})
    : super(imageIndex: imageIndex);

  ProductsLoadSuccess copyWith({
    List<ProductEntity>? products,
    int? imageIndex,
  }) {
    return ProductsLoadSuccess(
      products: products ?? this.products,
      imageIndex: imageIndex ?? this.imageIndex,
    );
  }
}

final class ProductLoadingError extends ProductsState {
  final int statusCode;
  final String message;

  ProductLoadingError({required this.statusCode, required this.message});
}
