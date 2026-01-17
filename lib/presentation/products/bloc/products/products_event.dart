part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class FetchProducts extends ProductsEvent {
  final String category;

  FetchProducts({required this.category});
}

class ClearProductsList extends ProductsEvent {}

class SearchProducts extends ProductsEvent {
  final String query;

  SearchProducts(this.query);
}

class ProductImageChanged extends ProductsEvent {
  final int index;
  ProductImageChanged(this.index);
}
