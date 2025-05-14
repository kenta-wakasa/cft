// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_memory_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentMemoryLogImpl _$$RecentMemoryLogImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentMemoryLogImpl(
      uid: json['uid'] as String,
      id: json['id'] as String? ?? '',
      documentId: json['documentId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      ansStartedAt: json['ansStartedAt'] == null
          ? null
          : DateTime.parse(json['ansStartedAt'] as String),
      ansFinishedAt: json['ansFinishedAt'] == null
          ? null
          : DateTime.parse(json['ansFinishedAt'] as String),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      memoryList: (json['memoryList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      answerList: (json['answerList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RecentMemoryLogImplToJson(
        _$RecentMemoryLogImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'documentId': instance.documentId,
      'createdAt': instance.createdAt.toIso8601String(),
      'ansStartedAt': instance.ansStartedAt?.toIso8601String(),
      'ansFinishedAt': instance.ansFinishedAt?.toIso8601String(),
      'finishedAt': instance.finishedAt?.toIso8601String(),
      'memoryList': instance.memoryList,
      'answerList': instance.answerList,
    };
