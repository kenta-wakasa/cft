// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semantic_fluency_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SemanticFluencyLogImpl _$$SemanticFluencyLogImplFromJson(
        Map<String, dynamic> json) =>
    _$SemanticFluencyLogImpl(
      id: json['id'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      userId: json['userId'] as String,
      answerWordWithTimestampList: (json['answerWordWithTimestampList']
                  as List<dynamic>?)
              ?.map((e) =>
                  AnswerWordWithTimestamp.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SemanticFluencyLogImplToJson(
        _$SemanticFluencyLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedAt': instance.startedAt.toIso8601String(),
      'userId': instance.userId,
      'answerWordWithTimestampList':
          instance.answerWordWithTimestampList.map((e) => e.toJson()).toList(),
    };
