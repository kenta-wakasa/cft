import 'package:freezed_annotation/freezed_annotation.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  factory Node({
    required String id,
    required double dx,
    required double dy,
  }) = _Node;
  const Node._();

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
