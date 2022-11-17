import 'package:ivory/domine/models/user/user_model.dart';

abstract class IUserRepo {
  Stream<UserModel> getUser(String userId);
  Future<void> updateUser(UserModel user);
  Future<void> createUser(UserModel user);
}
