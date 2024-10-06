// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerformanceProblemImpl _$$PerformanceProblemImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceProblemImpl(
      graph: Graph.fromJson(json['graph'] as Map<String, dynamic>),
      questionTexts: (json['questionTexts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PerformanceProblemImplToJson(
        _$PerformanceProblemImpl instance) =>
    <String, dynamic>{
      'graph': instance.graph.toJson(),
      'questionTexts': instance.questionTexts,
    };
