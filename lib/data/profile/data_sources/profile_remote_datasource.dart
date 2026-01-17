import 'package:clean_architecture_with_bloc/core/api_urls/api_urls.dart';
import 'package:clean_architecture_with_bloc/core/network/api_client.dart';
import 'package:clean_architecture_with_bloc/data/profile/models/logged_in_user_model.dart';


class ProfileRemoteDatasource {
  final ApiClient apiClient;

  ProfileRemoteDatasource(this.apiClient);

  Future<LoggedInUserModel> getUserDetails() async {
    final String path = ApiUrls.currentUSer;

    final response = await apiClient.getApi(path: path, tokenNeeded: true);

    return LoggedInUserModel.fromJson(response);
  }
}
