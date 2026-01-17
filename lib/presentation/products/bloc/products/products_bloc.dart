import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/product/product_entity.dart';
import 'package:clean_architecture_with_bloc/domain/products/usecases/get_products.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts getProducts;

  List<ProductEntity> _cachedProducts = [];

  ProductsBloc(this.getProducts) : super(ProductsInitial()) {
    on<FetchProducts>(_fetchProdcus);
    on<ClearProductsList>(_clearCachedProducts);
  }

  FutureOr<void> _fetchProdcus(
    FetchProducts event,
    Emitter<ProductsState> emit,
  ) async {
    if (_cachedProducts.isNotEmpty && event.category.isEmpty) {
      emit(ProductsLoadSuccess(products: _cachedProducts));
      return;
    }
    emit(ProductsLoading());
    try {
      emit(ProductsLoading());
      List<ProductEntity> prodcuts = [];
      if (prodcuts.isEmpty) {
        if (event.category == "all") {
          prodcuts = await getProducts.call();
        } else {
          prodcuts = await getProducts.call(category: event.category);
        }

        _cachedProducts = prodcuts;

        emit(ProductsLoadSuccess(products: prodcuts));
      }
    } catch (e) {
      emit(ProductLoadingError(message: e.toString(), statusCode: 0));
    }
  }

  FutureOr<void> _clearCachedProducts(
    ClearProductsList event,
    Emitter<ProductsState> emit,
  ) {
    _cachedProducts.clear();
    print("Cache size: ${_cachedProducts.length}");

    emit(ProductsInitial());
  }
}
