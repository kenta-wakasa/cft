// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_problem_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerformanceProblemLogImpl _$$PerformanceProblemLogImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceProblemLogImpl(
      uid: json['uid'] as String,
      id: json['id'] as String? ?? '',
      performanceProblems: (json['performanceProblems'] as List<dynamic>)
          .map((e) => PerformanceProblem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PerformanceProblemLogImplToJson(
        _$PerformanceProblemLogImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'performanceProblems':
          instance.performanceProblems.map((e) => e.toJson()).toList(),
    };
