// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'immediate_memory_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImmediateMemoryLogImpl _$$ImmediateMemoryLogImplFromJson(
        Map<String, dynamic> json) =>
    _$ImmediateMemoryLogImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      immediateMemoryProblem: ImmediateMemoryProblem.fromJson(
          json['immediateMemoryProblem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ImmediateMemoryLogImplToJson(
        _$ImmediateMemoryLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'immediateMemoryProblem': instance.immediateMemoryProblem.toJson(),
    };
