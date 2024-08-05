import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'operator.dart';

part 'simple_arithmetic_problem.freezed.dart';
part 'simple_arithmetic_problem.g.dart';

@freezed
class SimpleArithmeticProblem with _$SimpleArithmeticProblem {
  factory SimpleArithmeticProblem({
    required int a,
    required int b,
    required Operator randomOperator,
    DateTime? answeredAt,
    int? userAnswer,
  }) = _SimpleArithmeticProblem;
  const SimpleArithmeticProblem._();

  factory SimpleArithmeticProblem.fromJson(Map<String, dynamic> json) =>
      _$SimpleArithmeticProblemFromJson(json);

  static final random = Random.secure();

  factory SimpleArithmeticProblem.generate(Operator randomOperator) {
    final a = random.nextInt(9) + 1;
    final b = random.nextInt(9) + 1;

    return SimpleArithmeticProblem(
      a: a,
      b: b,
      randomOperator: randomOperator,
    );
  }

  double get answer {
    switch (randomOperator) {
      case Operator.addition:
        return (a + b).toDouble();
      case Operator.subtraction:
        return (a - b).toDouble();
      case Operator.multiplication:
        return (a * b).toDouble();
      case Operator.division:
        return a / b;
    }
  }

  /// ユーザーの回答が正解かどうか
  bool get isCorrect => userAnswer == answer;
}
