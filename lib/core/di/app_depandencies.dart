import 'package:clean_architecture_with_bloc/data/login/data_sourses/auth_remote_datasource.dart';
import 'package:clean_architecture_with_bloc/data/login/repositories/auth_repo_impl.dart';

import '../../core/network/api_client.dart';


import '../../domain/login/usecases/login_user.dart';

class AppDependencies {
  late final ApiClient apiClient;

  // Login feature
  late final AuthRemoteDataSource authRemoteDataSource;
  late final AuthRepositoryImpl authRepository;
  late final LoginUser loginUser;

  AppDependencies() {
    apiClient = ApiClient();

    // Login
    authRemoteDataSource = AuthRemoteDataSource(apiClient);
    authRepository = AuthRepositoryImpl(authRemoteDataSource);
    loginUser = LoginUser(authRepository);
  }
}
