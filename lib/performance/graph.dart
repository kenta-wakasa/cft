import 'package:freezed_annotation/freezed_annotation.dart';

import 'edge.dart';
import 'node.dart';

part 'graph.freezed.dart';
part 'graph.g.dart';

@freezed
class Graph with _$Graph {
  factory Graph({
    required List<Node> nodes,
    required List<Edge> edges,
  }) = _Graph;
  const Graph._();

  List<Node> inNodes(Node node) {
    return edges
        .where((e) => e.destinationId == node.id)
        .map((e) => nodes.firstWhere((n) => n.id == e.sourceId))
        .toList();
  }

  Node getNode(String id) {
    return nodes.firstWhere((n) => n.id == id);
  }

  factory Graph.fromJson(Map<String, dynamic> json) => _$GraphFromJson(json);
}
