// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistence_attention_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersistenceAttentionStateImpl _$$PersistenceAttentionStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PersistenceAttentionStateImpl(
      isPlaying: json['isPlaying'] as bool,
      problems: (json['problems'] as List<dynamic>)
          .map((e) =>
              SimpleArithmeticProblem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PersistenceAttentionStateImplToJson(
        _$PersistenceAttentionStateImpl instance) =>
    <String, dynamic>{
      'isPlaying': instance.isPlaying,
      'problems': instance.problems,
    };
