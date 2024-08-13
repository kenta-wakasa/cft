// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_attention_problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectAttentionProblemImpl _$$SelectAttentionProblemImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectAttentionProblemImpl(
      id: json['id'] as String,
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      endAt: json['endAt'] == null
          ? null
          : DateTime.parse(json['endAt'] as String),
      targetWords: (json['targetWords'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      textData:
          (json['textData'] as List<dynamic>).map((e) => e as String).toList(),
      userAnswerIndexes: (json['userAnswerIndexes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$$SelectAttentionProblemImplToJson(
        _$SelectAttentionProblemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedAt': instance.startedAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'targetWords': instance.targetWords,
      'textData': instance.textData,
      'userAnswerIndexes': instance.userAnswerIndexes.toList(),
    };
