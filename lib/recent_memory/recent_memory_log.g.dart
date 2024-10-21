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
      createdAt: DateTime.parse(json['createdAt'] as String),
      memoryList: (json['memoryList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answerList: (json['answerList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
    );

Map<String, dynamic> _$$RecentMemoryLogImplToJson(
        _$RecentMemoryLogImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'memoryList': instance.memoryList,
      'answerList': instance.answerList,
      'finishedAt': instance.finishedAt?.toIso8601String(),
    };
