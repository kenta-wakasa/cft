// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_problem_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculationProblemLogImpl _$$CalculationProblemLogImplFromJson(
        Map<String, dynamic> json) =>
    _$CalculationProblemLogImpl(
      uid: json['uid'] as String,
      id: json['id'] as String? ?? '',
      calculationProblems: (json['calculationProblems'] as List<dynamic>)
          .map((e) => CalculationProblem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CalculationProblemLogImplToJson(
        _$CalculationProblemLogImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'calculationProblems':
          instance.calculationProblems.map((e) => e.toJson()).toList(),
    };
