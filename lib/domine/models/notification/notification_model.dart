// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final String iconId;
  final String title;
  final String content;

  NotificationModel({
    required this.iconId,
    required this.title,
    required this.content,
  });

  NotificationModel copyWith({
    String? iconId,
    String? title,
    String? content,
  }) {
    return NotificationModel(
      iconId: iconId ?? this.iconId,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iconId': iconId,
      'title': title,
      'content': content,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      iconId: map['iconId'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [iconId, title, content];
}
