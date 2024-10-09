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
      answerTexts: (json['answerTexts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userAnswers: (json['userAnswers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      answeredAtList: (json['answeredAtList'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PerformanceProblemImplToJson(
        _$PerformanceProblemImpl instance) =>
    <String, dynamic>{
      'graph': instance.graph.toJson(),
      'questionTexts': instance.questionTexts,
      'answerTexts': instance.answerTexts,
      'userAnswers': instance.userAnswers,
      'startedAt': instance.startedAt?.toIso8601String(),
      'answeredAtList':
          instance.answeredAtList.map((e) => e.toIso8601String()).toList(),
    };
