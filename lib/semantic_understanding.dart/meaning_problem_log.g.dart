// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meaning_problem_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeaningProblemLogImpl _$$MeaningProblemLogImplFromJson(
        Map<String, dynamic> json) =>
    _$MeaningProblemLogImpl(
      uid: json['uid'] as String,
      id: json['id'] as String? ?? '',
      documentId: json['documentId'] as String?,
      meaningProblems: (json['meaningProblems'] as List<dynamic>)
          .map((e) => MeaningProblem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MeaningProblemLogImplToJson(
        _$MeaningProblemLogImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'documentId': instance.documentId,
      'meaningProblems':
          instance.meaningProblems.map((e) => e.toJson()).toList(),
    };
