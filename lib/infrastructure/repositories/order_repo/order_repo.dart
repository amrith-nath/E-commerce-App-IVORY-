import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ivory/domine/models/order/order_model.dart';

import '../../../domine/i_repositories/i_order_repo/i_order_repo.dart';

class OrderRepo extends IOrderRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Future<void> createOrder(OrderModel order) async {
    final orderDoc = fireStore.collection('orders').doc();

    await orderDoc
        .set(order.toMap(orderDoc))
        .then((value) => log('Order created'));
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

  @override
  Future<List<OrderModel>> getOrdersAsList() async {
    List<OrderModel> temporders = [];
    List<OrderModel> orders = [];

    try {
      var rawOrders = await fireStore.collection('orders').get();
      for (var element in rawOrders.docs) {
        temporders.add(OrderModel.fromSnapshot(element));
      }
      orders = temporders
          .where((element) =>
              element.customerId == FirebaseAuth.instance.currentUser!.email)
          .toList();
      return orders;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        log(e.message.toString());
      }
      return orders;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
