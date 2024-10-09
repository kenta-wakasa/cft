// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meaning_problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeaningProblemImpl _$$MeaningProblemImplFromJson(Map<String, dynamic> json) =>
    _$MeaningProblemImpl(
      question: json['question'] as String,
      commonReasons: (json['commonReasons'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
      userAns: json['userAns'] as String? ?? '',
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      answeredAt: json['answeredAt'] == null
          ? null
          : DateTime.parse(json['answeredAt'] as String),
    );

Map<String, dynamic> _$$MeaningProblemImplToJson(
        _$MeaningProblemImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'commonReasons': instance.commonReasons,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'userAns': instance.userAns,
      'startedAt': instance.startedAt?.toIso8601String(),
      'answeredAt': instance.answeredAt?.toIso8601String(),
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'easy',
  Difficulty.normal: 'normal',
  Difficulty.hard: 'hard',
};
