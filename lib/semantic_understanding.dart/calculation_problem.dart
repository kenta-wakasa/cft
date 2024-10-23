import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculation_problem.freezed.dart';
part 'calculation_problem.g.dart';

@freezed
class CalculationProblem with _$CalculationProblem {
  factory CalculationProblem({
    required String question,
    required String unit,
    required int answer,
    int? userAns,
    DateTime? startedAt,
    DateTime? answeredAt,
  }) = _CalculationProblem;
  const CalculationProblem._();

  factory CalculationProblem.fromJson(Map<String, dynamic> json) =>
      _$CalculationProblemFromJson(json);

  /// 正解かどうか
  bool? get isCorrect => userAns == null ? null : userAns == answer;

  /// 経過時間
  int get answerTime => answeredAt == null || startedAt == null
      ? 0
      : answeredAt!.difference(startedAt!).inMilliseconds;
}
