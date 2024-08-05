// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_arithmetic_problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimpleArithmeticProblemImpl _$$SimpleArithmeticProblemImplFromJson(
        Map<String, dynamic> json) =>
    _$SimpleArithmeticProblemImpl(
      a: (json['a'] as num).toInt(),
      b: (json['b'] as num).toInt(),
      randomOperator: $enumDecode(_$OperatorEnumMap, json['randomOperator']),
      userAnswer: (json['userAnswer'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SimpleArithmeticProblemImplToJson(
        _$SimpleArithmeticProblemImpl instance) =>
    <String, dynamic>{
      'a': instance.a,
      'b': instance.b,
      'randomOperator': _$OperatorEnumMap[instance.randomOperator]!,
      'userAnswer': instance.userAnswer,
    };

const _$OperatorEnumMap = {
  Operator.addition: 'addition',
  Operator.subtraction: 'subtraction',
  Operator.multiplication: 'multiplication',
  Operator.division: 'division',
};
