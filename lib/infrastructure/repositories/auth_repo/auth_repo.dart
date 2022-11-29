import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ivory/domine/i_repositories/i_auth-repo/i_auth_repo.dart';
import 'package:ivory/domine/models/user/user_model.dart';
import 'package:ivory/infrastructure/repositories/user_repo/user_repo.dart';

import '../../../presentation/core/widget/snackbar.dart';

class AuthRepo extends IAuthRepo {
  final FirebaseAuth auth;
  UserRepo userRepo = UserRepo();
  AuthRepo({FirebaseAuth? auth2}) : auth = auth2 ?? FirebaseAuth.instance;

  @override
  Future<void> loginWithEmail(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // return authCredential.user;
    } on FirebaseAuthException catch (e) {
      kSnackBar('Error', '${e.message}');
    }
  }

  @override
  Future<User?> signUp(
      {required String email,
      required String password,
      required UserModel user}) async {
    try {
      final authCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userRepo.createUser(user);

      return authCredential.user;
    } on FirebaseAuthException catch (e) {
      kSnackBar('Error', '${e.message}');

      // return null;
    }
  }

  @override
  Future<void> signout() async {
    await auth.signOut();
  }

  @override
  Stream<User?> get user => auth.userChanges();
}
