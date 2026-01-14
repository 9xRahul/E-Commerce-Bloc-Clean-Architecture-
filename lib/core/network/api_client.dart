import 'package:clean_architecture_with_bloc/core/api_urls/api_urls.dart';
import 'package:clean_architecture_with_bloc/core/error/api_exceptions.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio();

  Future<dynamic> postApi(dynamic data) async {
    final response = await dio.post(ApiUrls.loginUrl, data: data);

    final responseData = getResponseData(response);
    print(responseData);
    return responseData;
  }

  dynamic getResponseData(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        var dataToBeReturn = response.data;
        return dataToBeReturn;
      case 401:
        var dataToBeReturn = response.data;
        print(dataToBeReturn);
        return InvalidCredentialsException().message;
    }
  }
}
