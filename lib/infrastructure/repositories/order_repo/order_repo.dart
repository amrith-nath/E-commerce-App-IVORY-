import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ivory/domine/models/order/order_model.dart';

import '../../../domine/i_repositories/i_order_repo/i_order_repo.dart';

class OrderRepo extends IOrderRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Future<void> createOrder(OrderModel order) async {
    final orderDoc = fireStore.collection("users").doc();

    await orderDoc
        .set(order.toMap(orderDoc))
        .then((value) => log('User created'));
  }

  @override
  Stream<List<OrderModel>> getOrders() {
    return fireStore.collection('orders').snapshots().map((snapshot) {
      log('getordersfunction started');

      return (snapshot.docs.map((doc) {
        return OrderModel.fromSnapshot(doc);
      }).toList());
    });
  }

  @override
  Future<void> updateOrder(
      OrderModel order, String field, dynamic value) async {
    await fireStore
        .collection('orders')
        .where('id', isEqualTo: order.id)
        .get()
        .then((snap) => snap.docs.first.reference.update({field: value}));
  }
}
