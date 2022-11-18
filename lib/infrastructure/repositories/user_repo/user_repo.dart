import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ivory/domine/i_repositories/i_user_repo/i_user_repo.dart';
import 'package:ivory/domine/models/user/user_model.dart';

class UserRepo implements IUserRepo {
  final FirebaseFirestore firestore;
  UserRepo({
    FirebaseFirestore? firestore2,
  }) : firestore = firestore2 ?? FirebaseFirestore.instance;

  @override
  Future<void> createUser(UserModel user) async {
    await firestore
        .collection("users")
        .doc(user.id)
        .set(user.toMap())
        .then((value) => log('User created'));
  }

  @override
  Stream<UserModel> getUser(String userId) {
    log('Getting userdata from firestore');
    return firestore
        .collection("users")
        .doc(userId)
        .snapshots()
        .map((snapshot) => UserModel.fromSnapShot(snapshot));
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await firestore
        .collection('users')
        .doc(user.id)
        .update(user.toDocument())
        .then((value) => log('User updated'));
  }
}
