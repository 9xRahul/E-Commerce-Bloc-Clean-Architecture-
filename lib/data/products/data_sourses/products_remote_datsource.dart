import 'package:clean_architecture_with_bloc/core/api_urls/api_urls.dart';
import 'package:clean_architecture_with_bloc/core/network/api_client.dart';

import 'package:clean_architecture_with_bloc/data/products/models/product/products_model.dart';

class ProductRemoteDataSource {
  final ApiClient apiClient;

  ProductRemoteDataSource(this.apiClient);

  Future<List<ProductModel>> getAllProducts({String? category}) async {
    print("Reached remote data source");

    final String path = (category == null || category.isEmpty)
        ? ApiUrls.getAllProducts
        : "${ApiUrls.getAllProducts}/category/$category";

    final response = await apiClient.getApi(path: path); // ✅ use path

    final list = response['products'] as List;

    return list.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<List<ProductModel>> searchProducts({String? query}) async {
    final path = ApiUrls.searchProducts;
    final Map<String, dynamic> q = {"q": query};
    final response = await apiClient.getApi(path: path, queryParams: q);
    final list = response['products'] as List;
    return list.map((e) => ProductModel.fromJson(e)).toList();
  }
}
