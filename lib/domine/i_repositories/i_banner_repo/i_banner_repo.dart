import 'package:ivory/domine/models/banner/banner_model.dart';

abstract class IBannerRepo {
  Stream<List<BannerModel>> getBanners();
}
