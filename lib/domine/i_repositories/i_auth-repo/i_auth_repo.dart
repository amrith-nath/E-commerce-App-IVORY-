import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepo {
  Stream<User?> get user;
  Future<User?> signUp({
    required String email,
    required String password,
  });
  Future<void> loginWithEmail({
    required String email,
    required String password,
  });

  Future<void> signout();
}
