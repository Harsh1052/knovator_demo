import 'dart:async';

import 'package:flutter/cupertino.dart';

class Post {
  final int id;
  final String title;
  final String body;
  final bool isVisited;
  final GlobalKey key;
  final Timer? timer;
  final int? tick;
  Post(
      {required this.id,
      required this.title,
      required this.body,
      this.isVisited = false,
      this.timer,
      required this.key,this.tick = 0});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      key: GlobalKey(),
    );
  }

  Post copyWith({int? id, String? title, String? body, bool? isVisited, Timer? timer, int? tick}) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      isVisited: isVisited ?? this.isVisited,
      key: key,
      timer: timer??this.timer,
      tick: tick??this.tick,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'isVisited': false,
    };
  }
}
