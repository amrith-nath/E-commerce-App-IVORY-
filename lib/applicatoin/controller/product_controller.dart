import 'dart:developer';

import 'package:get/get.dart';
import 'package:ivory/domine/models/product/product_model.dart';
import 'package:ivory/infrastructure/repositories/product_repo/product_repo.dart';

class ProductController extends GetxController {
  ProductRepo productRepo = ProductRepo();
  // DatabaseService databaseService = DatabaseService();
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    // products.bindStream(productRepo.getProducts());

    log(products.length.toString());

    super.onInit();
  }

  Future<void> updateProduct(
    ProductModel product,
    String field,
    double value,
  ) async {
    await productRepo.updateProducts(product, field, value);
  }

  var isImageLoading = false;
  var newProduct = {}.obs;

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get name => newProduct['name'];
  List<String> get images => newProduct['images'];
  get description => newProduct['description'];
  get maincategory => newProduct['mainCategory'];
  get subcategory => newProduct['subcategory'];
  get colors => newProduct['colors'];
  // List<String> get sizes => newProduct['sizes'];

  String mainCategory = 'Men';
  String subCategory = 'Fasion';
  List<String> size = [];
  String shoeSize = '8';
}
