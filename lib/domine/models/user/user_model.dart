// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String image;
  final String name;
  final String email;
  final List<String> allOrders;
  final Map<String, int> cart;
  final List<String> currentOrder;
  final List<String> favourites;

  final Map<dynamic, dynamic> address;
  const UserModel({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
    required this.allOrders,
    required this.cart,
    required this.currentOrder,
    required this.address,
    required this.favourites,
  });

  UserModel copyWith({
    String? id,
    String? image,
    String? name,
    String? email,
    List<String>? allOrders,
    Map<String, int>? cart,
    List<String>? currentOrder,
    List<String>? favourites,
    Map<dynamic, dynamic>? address,
  }) {
    return UserModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      email: email ?? this.email,
      allOrders: allOrders ?? this.allOrders,
      cart: cart ?? this.cart,
      currentOrder: currentOrder ?? this.currentOrder,
      address: address ?? this.address,
      favourites: favourites ?? this.favourites,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'allOrders': allOrders,
      'cart': cart,
      'currentOrder': currentOrder,
      'address': address,
      'favourites': favourites,
    };
  }

  Map<String, dynamic> toDocument() {
    return <String, Object>{
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'allOrders': allOrders,
      'cart': cart,
      'currentOrder': currentOrder,
      'address': address,
      'favourites': favourites,
    };
  }

  factory UserModel.fromSnapShot(DocumentSnapshot snap) {
    return UserModel(
      id: snap['id'] as String,
      image: snap['image'] as String,
      name: snap['name'] as String,
      email: snap['email'] as String,
      allOrders: List<String>.from((snap['allOrders'] as List)),
      cart: Map<String, int>.from((snap['cart'] as Map<dynamic, dynamic>)),
      currentOrder: List<String>.from((snap['currentOrder'] as List)),
      address: Map<dynamic, dynamic>.from(
          (snap['address'] as Map<dynamic, dynamic>)),
      favourites: List<String>.from((snap['favourites'] as List)),
    );
  }

  // String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      image,
      name,
      email,
      allOrders,
      cart,
      currentOrder,
      address,
      favourites,
    ];
  }
}
