import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ivory/infrastructure/repositories/user_repo/user_repo.dart';

import '../../domine/models/user/user_model.dart';

class UserController extends GetxController {
  UserRepo userRepo = UserRepo();

  var user = <UserModel>[].obs;
  var newBanner = {}.obs;

  @override
  void onInit() {
    user.bindStream(userRepo.getUsers());
    super.onInit();
  }

  get image => newBanner['image'];
  get tag => newBanner['tag'];
}
