// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_attention_problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectAttentionProblemImpl _$$SelectAttentionProblemImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectAttentionProblemImpl(
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
      'targetWords': instance.targetWords,
      'textData': instance.textData,
      'userAnswerIndexes': instance.userAnswerIndexes.toList(),
    };
