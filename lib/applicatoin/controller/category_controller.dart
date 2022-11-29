import 'package:get/get.dart';
import 'package:ivory/domine/models/category/category_model.dart';
import 'package:ivory/infrastructure/repositories/category_repo/category_repo.dart';

class CategoryController extends GetxController {
  CategoryRepo categoryRepo = CategoryRepo();

  var banners = <CategoryModel>[].obs;
  var newBanner = {}.obs;

  @override
  void onInit() {
    banners.bindStream(categoryRepo.getcategory());
    super.onInit();
  }

  get image => newBanner['image'];
  get tag => newBanner['tag'];
}
