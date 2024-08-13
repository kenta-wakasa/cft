// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'immediate_memory_problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImmediateMemoryProblemImpl _$$ImmediateMemoryProblemImplFromJson(
        Map<String, dynamic> json) =>
    _$ImmediateMemoryProblemImpl(
      randomNumbers: (json['randomNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userAnswerNumbers: (json['userAnswerNumbers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      endAt: json['endAt'] == null
          ? null
          : DateTime.parse(json['endAt'] as String),
    );

Map<String, dynamic> _$$ImmediateMemoryProblemImplToJson(
        _$ImmediateMemoryProblemImpl instance) =>
    <String, dynamic>{
      'randomNumbers': instance.randomNumbers,
      'userAnswerNumbers': instance.userAnswerNumbers,
      'startedAt': instance.startedAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
    };
