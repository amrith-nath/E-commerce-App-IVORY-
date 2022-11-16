// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final String? iconId;
  final String? title;
  final String? content;

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
      iconId: map['iconId'] != null ? map['iconId'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        iconId as Object,
        title as Object,
        content as Object,
      ];
}
