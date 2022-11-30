import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ivory/domine/i_repositories/i_product_repo/i_product_repo.dart';
import 'package:ivory/domine/models/product/product_model.dart';

class ProductRepo extends IProductRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Stream<List<ProductModel>> getProducts() {
    return fireStore.collection('products').snapshots().map((snapshot) {
      log('getproducts function started');

      return (snapshot.docs.map((doc) {
        return ProductModel.fromSnapShot(doc);
      }).toList());
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

  @override
  Future<List<ProductModel>> getProductsAsList() async {
    List<ProductModel> products = [];
    try {
      var rawProducts = await fireStore.collection('products').get();
      for (var element in rawProducts.docs) {
        products.add(ProductModel.fromSnapShot(element));
      }
      return products;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        log(e.message.toString());
      }
      return products;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
