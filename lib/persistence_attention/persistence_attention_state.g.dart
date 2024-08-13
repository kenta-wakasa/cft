// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistence_attention_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersistenceAttentionStateImpl _$$PersistenceAttentionStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PersistenceAttentionStateImpl(
      isPlaying: json['isPlaying'] as bool? ?? false,
      problems: (json['problems'] as List<dynamic>)
          .map((e) =>
              SimpleArithmeticProblem.fromJson(e as Map<String, dynamic>))
          .toList(),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      countDownTime: (json['countDownTime'] as num).toInt(),
      isTimeUp: json['isTimeUp'] as bool? ?? false,
    );

Map<String, dynamic> _$$PersistenceAttentionStateImplToJson(
        _$PersistenceAttentionStateImpl instance) =>
    <String, dynamic>{
      'isPlaying': instance.isPlaying,
      'problems': instance.problems.map((e) => e.toJson()).toList(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'countDownTime': instance.countDownTime,
      'isTimeUp': instance.isTimeUp,
    };
