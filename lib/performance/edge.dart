import 'package:freezed_annotation/freezed_annotation.dart';

part 'edge.freezed.dart';
part 'edge.g.dart';

@freezed
class Edge with _$Edge {
  factory Edge({
    required String sourceId,
    required String destinationId,
    required int fee,
    required int time,
  }) = _Edge;
  const Edge._();

  factory Edge.fromJson(Map<String, dynamic> json) => _$EdgeFromJson(json);
}
