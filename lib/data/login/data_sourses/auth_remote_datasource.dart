import 'package:clean_architecture_with_bloc/data/login/models/user_model.dart';

import '../../../core/network/api_client.dart';

class AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSource(this.client);

  Future<UserModel> login(String username, String password) async {
    Map<String, dynamic> data = {"username": username, "password": password};
    print(data);
    var response = await ApiClient().postApi(data);

    return UserModel.fromJson(response);
  }
}
