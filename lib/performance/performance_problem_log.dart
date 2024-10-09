import 'package:cft/performance/performance_problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'performance_problem_log.freezed.dart';
part 'performance_problem_log.g.dart';

@freezed
class PerformanceProblemLog with _$PerformanceProblemLog {
  factory PerformanceProblemLog({
    required String uid,
    required List<PerformanceProblem> performanceProblems,
  }) = _PerformanceProblemLog;
  const PerformanceProblemLog._();

  factory PerformanceProblemLog.fromJson(Map<String, dynamic> json) =>
      _$PerformanceProblemLogFromJson(json);
}
