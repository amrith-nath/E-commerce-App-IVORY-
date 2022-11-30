import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ivory/domine/i_repositories/i_user_repo/i_user_repo.dart';
import 'package:ivory/domine/models/user/user_model.dart';

class UserRepo extends IUserRepo {
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

  Stream<List<UserModel>> getUsers() {
    return firestore.collection("users").snapshots().map((snapshot) =>
        snapshot.docs.map((e) => UserModel.fromSnapShot(e)).toList());
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

  Future<UserModel> getuser() async {
    List<UserModel> userList = [];
    var rawuser = await firestore.collection('users').get();
    for (var element in rawuser.docs) {
      userList.add(UserModel.fromSnapShot(element));
    }
    var user = userList.firstWhere(
        (element) => element.id == FirebaseAuth.instance.currentUser!.email);
    return user;
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
