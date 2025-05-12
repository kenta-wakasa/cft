import 'package:cft/semantic_understanding.dart/calculation_problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculation_problem_log.freezed.dart';
part 'calculation_problem_log.g.dart';

@freezed
class CalculationProblemLog with _$CalculationProblemLog {
  factory CalculationProblemLog({
    required String uid,
    required String? documentId,
    @Default('') String id,
    required List<CalculationProblem> calculationProblems,
  }) = _CalculationProblemLog;
  const CalculationProblemLog._();

  factory CalculationProblemLog.fromJson(Map<String, dynamic> json) =>
      _$CalculationProblemLogFromJson(json);

  /// 正解数
  int get correctCount =>
      calculationProblems.where((problem) => problem.isCorrect == true).length;

  /// 誤答数
  int get incorrectCount =>
      calculationProblems.where((problem) => problem.isCorrect != true).length;

  /// 正解率
  double get correctRate => correctCount / calculationProblems.length;
}
