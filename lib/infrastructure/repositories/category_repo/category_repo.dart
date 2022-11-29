import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ivory/domine/i_repositories/I_category_repo/i_category_repo.dart';
import 'package:ivory/domine/models/category/category_model.dart';

class CategoryRepo extends ICategoryRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Stream<List<CategoryModel>> getcategory() {
    return fireStore.collection('categories').snapshots().map((snapshot) {
      return (snapshot.docs
          .map((doc) => CategoryModel.fromSnapShot(doc))
          .toList());
    });
  }
}
