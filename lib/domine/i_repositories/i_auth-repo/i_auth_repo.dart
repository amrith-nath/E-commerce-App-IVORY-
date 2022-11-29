import 'package:firebase_auth/firebase_auth.dart';
import 'package:ivory/domine/models/user/user_model.dart';

abstract class IAuthRepo {
  Stream<User?> get user;
  Future<User?> signUp(
      {required String email,
      required String password,
      required UserModel user});
  Future<void> loginWithEmail({
    required String email,
    required String password,
  });

  Future<void> signout();
}
