import 'package:ivory/domine/models/order/order_model.dart';

abstract class IOrderRepo {
  Stream<List<OrderModel>> getOrders();
  Future<void> createOrder(OrderModel order);
  Future<void> updateOrder(OrderModel order, String field, dynamic value);
}
