// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'dart:convert';

import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String? id;
  final String? category;
  final List<String>? colors;
  final String? description;
  final List<String>? images;
  final String? mainCategory;
  final String? name;
  final int? noOfRating;
  final double? price;
  final double? quantity;
  final double? rating;
  final List<String>? size;
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
      id: map['id'] != null ? map['id'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      colors: map['colors'] != null
          ? List<String>.from((map['colors'] as List<String>))
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      images: map['images'] != null
          ? List<String>.from((map['images'] as List<String>))
          : null,
      mainCategory:
          map['mainCategory'] != null ? map['mainCategory'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      noOfRating: map['noOfRating'] != null ? map['noOfRating'] as int : null,
      price: map['price'] != null ? map['price'] as double : null,
      quantity: map['quantity'] != null ? map['quantity'] as double : null,
      rating: map['rating'] != null ? map['rating'] as double : null,
      size: map['size'] != null
          ? List<String>.from((map['size'] as List<String>))
          : null,
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
      id as Object,
      category as Object,
      colors as Object,
      description as Object,
      images as Object,
      mainCategory as Object,
      name as Object,
      noOfRating as Object,
      price as Object,
      quantity as Object,
      rating as Object,
      size as Object,
    ];
  }
}
