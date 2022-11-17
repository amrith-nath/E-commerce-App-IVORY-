// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CoupenModel extends Equatable {
  final String id;
  final String code;
  final double amount;
  const CoupenModel({
    required this.id,
    required this.code,
    required this.amount,
  });

  CoupenModel copyWith({
    String? id,
    String? code,
    double? amount,
  }) {
    return CoupenModel(
      id: id ?? this.id,
      code: code ?? this.code,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'amount': amount,
    };
  }

  factory CoupenModel.fromMap(Map<String, dynamic> map) {
    return CoupenModel(
      id: map['id'] as String,
      code: map['code'] as String,
      amount: map['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoupenModel.fromJson(String source) =>
      CoupenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, code, amount];
}
