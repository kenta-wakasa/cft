import 'package:cft/semantic_understanding.dart/calculation_problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculation_problem_log.freezed.dart';
part 'calculation_problem_log.g.dart';

@freezed
class CalculationProblemLog with _$CalculationProblemLog {
  factory CalculationProblemLog({
    required String uid,
    @Default('') String id,
    required List<CalculationProblem> calculationProblems,
  }) = _CalculationProblemLog;
  const CalculationProblemLog._();

  factory CalculationProblemLog.fromJson(Map<String, dynamic> json) =>
      _$CalculationProblemLogFromJson(json);
}
