import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'node.freezed.dart';

@freezed
class Node with _$Node {
  factory Node({
    required String id,
    required Offset offset,
  }) = _Node;
  const Node._();
}
