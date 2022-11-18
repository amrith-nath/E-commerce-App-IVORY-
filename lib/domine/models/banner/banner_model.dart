// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final String image;
  final String tag;
  const BannerModel({
    required this.image,
    required this.tag,
  });

  BannerModel copyWith({
    String? image,
    String? tag,
  }) {
    return BannerModel(
      image: image ?? this.image,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'tag': tag,
    };
  }

  factory BannerModel.fromSnapShot(DocumentSnapshot map) {
    return BannerModel(
      image: map['image'] as String,
      tag: map['tag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory BannerModel.fromJson(String source) =>
  //     BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [image, tag];
}
