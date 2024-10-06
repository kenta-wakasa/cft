// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GraphImpl _$$GraphImplFromJson(Map<String, dynamic> json) => _$GraphImpl(
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
      edges: (json['edges'] as List<dynamic>)
          .map((e) => Edge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GraphImplToJson(_$GraphImpl instance) =>
    <String, dynamic>{
      'nodes': instance.nodes.map((e) => e.toJson()).toList(),
      'edges': instance.edges.map((e) => e.toJson()).toList(),
    };
