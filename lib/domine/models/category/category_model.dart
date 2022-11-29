// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String title;
  final String image;
  const CategoryModel({
    required this.title,
    required this.image,
  });

  CategoryModel copyWith({
    String? title,
    String? image,
  }) {
    return CategoryModel(
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
    };
  }

  factory CategoryModel.fromSnapShot(DocumentSnapshot map) {
    return CategoryModel(
      title: map['title'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [title];
}
