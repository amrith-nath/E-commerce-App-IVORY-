import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ivory/domine/i_repositories/i_product_repo/i_product_repo.dart';
import 'package:ivory/domine/models/product/product_model.dart';

class ProductRepo extends IProductRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Stream<List<ProductModel>> getProducts() {
    return fireStore.collection('products').snapshots().map((snapshot) {
      return (snapshot.docs
          .map((doc) => ProductModel.fromSnapShot(doc))
          .toList());
    });
  }

  @override
  Future<void> updateProducts(ProductModel product, String field, value) async {
    await fireStore
        .collection('products')
        .where('id', isEqualTo: product.id)
        .get()
        .then((snap) => snap.docs.first.reference.update({field: value}));
  }
}
