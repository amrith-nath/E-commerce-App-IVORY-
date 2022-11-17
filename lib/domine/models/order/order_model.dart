// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final String id;
  final String customerId;
  final List<String> productId;
  final double deliveryFee;
  final double total;
  final double subTotal;
  final bool isAccepted;
  final bool isShiped;
  final bool isDeliverd;
  final bool isRejected;
  const OrderModel({
    required this.id,
    required this.customerId,
    required this.productId,
    required this.deliveryFee,
    required this.total,
    required this.subTotal,
    required this.isAccepted,
    required this.isShiped,
    required this.isDeliverd,
    required this.isRejected,
  });

  OrderModel copyWith({
    String? id,
    String? customerId,
    List<String>? productId,
    double? deliveryFee,
    double? total,
    double? subTotal,
    bool? isAccepted,
    bool? isShiped,
    bool? isDeliverd,
    bool? isRejected,
  }) {
    return OrderModel(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      productId: productId ?? this.productId,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      total: total ?? this.total,
      subTotal: subTotal ?? this.subTotal,
      isAccepted: isAccepted ?? this.isAccepted,
      isShiped: isShiped ?? this.isShiped,
      isDeliverd: isDeliverd ?? this.isDeliverd,
      isRejected: isRejected ?? this.isRejected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerId': customerId,
      'productId': productId,
      'deliveryFee': deliveryFee,
      'total': total,
      'subTotal': subTotal,
      'isAccepted': isAccepted,
      'isShiped': isShiped,
      'isDeliverd': isDeliverd,
      'isRejected': isRejected,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      customerId: map['customerId'] as String,
      productId: List<String>.from((map['productId'] as List<String>)),
      deliveryFee: map['deliveryFee'] as double,
      total: map['total'] as double,
      subTotal: map['subTotal'] as double,
      isAccepted: map['isAccepted'] as bool,
      isShiped: map['isShiped'] as bool,
      isDeliverd: map['isDeliverd'] as bool,
      isRejected: map['isRejected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      customerId,
      productId,
      deliveryFee,
      total,
      subTotal,
      isAccepted,
      isShiped,
      isDeliverd,
      isRejected,
    ];
  }
}
