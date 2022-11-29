import 'package:ivory/domine/models/category/category_model.dart';

abstract class ICategoryRepo {
  Stream<List<CategoryModel>> getcategory();
}
