// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistence_attention_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersistenceAttentionLogImpl _$$PersistenceAttentionLogImplFromJson(
        Map<String, dynamic> json) =>
    _$PersistenceAttentionLogImpl(
      id: json['id'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      userId: json['userId'] as String,
      problems: (json['problems'] as List<dynamic>)
          .map((e) =>
              SimpleArithmeticProblem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PersistenceAttentionLogImplToJson(
        _$PersistenceAttentionLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedAt': instance.startedAt.toIso8601String(),
      'userId': instance.userId,
      'problems': instance.problems.map((e) => e.toJson()).toList(),
    };
