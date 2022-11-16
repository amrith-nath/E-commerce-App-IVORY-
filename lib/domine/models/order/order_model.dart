// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final String? id;
  final String? customerId;
  final List<String>? productId;
  final double? deliveryFee;
  final double? total;
  final double? subTotal;
  final bool? isAccepted;
  final bool? isShiped;
  final bool? isDeliverd;
  final bool? isRejected;
  const OrderModel({
    this.id,
    this.customerId,
    this.productId,
    this.deliveryFee,
    this.total,
    this.subTotal,
    this.isAccepted,
    this.isShiped,
    this.isDeliverd,
    this.isRejected,
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
      id: map['id'] != null ? map['id'] as String : null,
      customerId:
          map['customerId'] != null ? map['customerId'] as String : null,
      productId: map['productId'] != null
          ? List<String>.from((map['productId'] as List<String>))
          : null,
      deliveryFee:
          map['deliveryFee'] != null ? map['deliveryFee'] as double : null,
      total: map['total'] != null ? map['total'] as double : null,
      subTotal: map['subTotal'] != null ? map['subTotal'] as double : null,
      isAccepted: map['isAccepted'] != null ? map['isAccepted'] as bool : null,
      isShiped: map['isShiped'] != null ? map['isShiped'] as bool : null,
      isDeliverd: map['isDeliverd'] != null ? map['isDeliverd'] as bool : null,
      isRejected: map['isRejected'] != null ? map['isRejected'] as bool : null,
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
      id as Object,
      customerId as Object,
      productId as Object,
      deliveryFee as Object,
      total as Object,
      subTotal as Object,
      isAccepted as Object,
      isShiped as Object,
      isDeliverd as Object,
      isRejected as Object,
    ];
  }
}
