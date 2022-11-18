// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'dart:convert';

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String category;
  final List<String> colors;
  final String description;
  final List<String> images;
  final String mainCategory;
  final String name;
  final int noOfRating;
  final double price;
  final double quantity;
  final double rating;
  final List<String> size;
  const ProductModel({
    required this.id,
    required this.category,
    required this.colors,
    required this.description,
    required this.images,
    required this.mainCategory,
    required this.name,
    required this.noOfRating,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.size,
  });

  ProductModel copyWith({
    String? id,
    String? category,
    List<String>? colors,
    String? description,
    List<String>? images,
    String? mainCategory,
    String? name,
    int? noOfRating,
    double? price,
    double? quantity,
    double? rating,
    List<String>? size,
  }) {
    return ProductModel(
      id: id ?? this.id,
      category: category ?? this.category,
      colors: colors ?? this.colors,
      description: description ?? this.description,
      images: images ?? this.images,
      mainCategory: mainCategory ?? this.mainCategory,
      name: name ?? this.name,
      noOfRating: noOfRating ?? this.noOfRating,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      rating: rating ?? this.rating,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'colors': colors,
      'description': description,
      'images': images,
      'mainCategory': mainCategory,
      'name': name,
      'noOfRating': noOfRating,
      'price': price,
      'quantity': quantity,
      'rating': rating,
      'size': size,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      category: map['category'] as String,
      colors: List<String>.from((map['colors'] as List<String>)),
      description: map['description'] as String,
      images: List<String>.from((map['images'] as List<String>)),
      mainCategory: map['mainCategory'] as String,
      name: map['name'] as String,
      noOfRating: map['noOfRating'] as int,
      price: map['price'] as double,
      quantity: map['quantity'] as double,
      rating: map['rating'] as double,
      size: List<String>.from((map['size'] as List<String>)),
    );
  }

  factory ProductModel.fromSnapShot(DocumentSnapshot snapshot) {
    return ProductModel(
      id: snapshot['id'] as String,
      category: snapshot['category'] as String,
      colors: List<String>.from((snapshot['colors'] as List<String>)),
      description: snapshot['description'] as String,
      images: List<String>.from((snapshot['images'] as List<String>)),
      mainCategory: snapshot['mainCategory'] as String,
      name: snapshot['name'] as String,
      noOfRating: snapshot['noOfRating'] as int,
      price: snapshot['price'] as double,
      quantity: snapshot['quantity'] as double,
      rating: snapshot['rating'] as double,
      size: List<String>.from((snapshot['size'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      category,
      colors,
      description,
      images,
      mainCategory,
      name,
      noOfRating,
      price,
      quantity,
      rating,
      size,
    ];
  }
}
