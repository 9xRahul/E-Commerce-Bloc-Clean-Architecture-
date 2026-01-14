import 'package:clean_architecture_with_bloc/domain/login/entities/user.dart';

import '../models/user_model.dart';

class UserMapper {
  static User toEntity(UserModel model) {
    return User(
      id: model.id,
      username: model.username,
      email: model.email,
      firstName: model.firstName,
      lastName: model.lastName,
      token: model.accessToken,
    );
  }
}
