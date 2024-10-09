// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculationProblemImpl _$$CalculationProblemImplFromJson(
        Map<String, dynamic> json) =>
    _$CalculationProblemImpl(
      question: json['question'] as String,
      unit: json['unit'] as String,
      answer: (json['answer'] as num).toInt(),
      userAns: (json['userAns'] as num?)?.toInt(),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      answeredAt: json['answeredAt'] == null
          ? null
          : DateTime.parse(json['answeredAt'] as String),
    );

Map<String, dynamic> _$$CalculationProblemImplToJson(
        _$CalculationProblemImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'unit': instance.unit,
      'answer': instance.answer,
      'userAns': instance.userAns,
      'startedAt': instance.startedAt?.toIso8601String(),
      'answeredAt': instance.answeredAt?.toIso8601String(),
    };
