// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_attention_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectAttentionLogImpl _$$SelectAttentionLogImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectAttentionLogImpl(
      id: json['id'] as String,
      documentId: json['documentId'] as String?,
      userId: json['userId'] as String,
      selectAttentionProblems: (json['selectAttentionProblems']
              as List<dynamic>)
          .map(
              (e) => SelectAttentionProblem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SelectAttentionLogImplToJson(
        _$SelectAttentionLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'userId': instance.userId,
      'selectAttentionProblems':
          instance.selectAttentionProblems.map((e) => e.toJson()).toList(),
    };
