import 'package:clean_architecture_with_bloc/data/login/data_sourses/auth_remote_datasource.dart';
import 'package:clean_architecture_with_bloc/domain/login/entities/user.dart';
import 'package:clean_architecture_with_bloc/domain/login/repositories/auth_repository.dart';

import '../mappers/user_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String username, String password) async {
    final model = await remoteDataSource.login(username, password);
   
    return UserMapper.toEntity(model);
  }
}
