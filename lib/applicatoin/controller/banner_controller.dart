import 'package:get/get.dart';
import 'package:ivory/domine/models/banner/banner_model.dart';
import 'package:ivory/infrastructure/repositories/banner_repo/banner_repo.dart';

class BannerController extends GetxController {
  BannerRepo bannerRepo = BannerRepo();

  var banners = <BannerModel>[].obs;
  var newBanner = {}.obs;

  var isImageLoading = false;

  @override
  void onInit() {
    banners.bindStream(bannerRepo.getBanners());
    super.onInit();
  }

  get image => newBanner['image'];
  get tag => newBanner['tag'];
}
