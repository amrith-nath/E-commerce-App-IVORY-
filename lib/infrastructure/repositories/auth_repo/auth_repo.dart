import 'package:firebase_auth/firebase_auth.dart';
import 'package:ivory/domine/i_repositories/i_auth-repo/i_auth_repo.dart';

class AuthRepo implements IAuthRepo {
  final FirebaseAuth auth;

  AuthRepo({FirebaseAuth? auth2}) : auth = auth2 ?? FirebaseAuth.instance;

  @override
  Future<void> loginWithEmail(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // return authCredential.user;
    } catch (_) {}
  }

  @override
  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      final authCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return authCredential.user;
    } catch (_) {
      throw Error();
    }
  }

  @override
  Future<void> signout() async {
    await auth.signOut();
  }

  @override
  Stream<User?> get user => auth.userChanges();
}
