import 'package:ivory/domine/models/product/product_model.dart';

abstract class IProductRepo {
  Stream<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getProductsAsList();
  Future<void> updateProducts(
      ProductModel product, String field, dynamic value);
}
