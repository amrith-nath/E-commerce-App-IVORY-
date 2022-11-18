import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ivory/domine/i_repositories/i_banner_repo/i_banner_repo.dart';
import 'package:ivory/domine/models/banner/banner_model.dart';

class BannerRepo extends IBannerRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Stream<List<BannerModel>> getBanners() {
    return fireStore.collection('banners').snapshots().map((snapshot) {
      return (snapshot.docs
          .map((doc) => BannerModel.fromSnapShot(doc))
          .toList());
    });
  }
}
