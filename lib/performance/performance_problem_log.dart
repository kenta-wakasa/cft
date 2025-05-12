import 'package:cft/performance/performance_problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'performance_problem_log.freezed.dart';
part 'performance_problem_log.g.dart';

@freezed
class PerformanceProblemLog with _$PerformanceProblemLog {
  factory PerformanceProblemLog({
    required String uid,
    @Default('') String id,
    required String? documentId,
    required List<PerformanceProblem> performanceProblems,
  }) = _PerformanceProblemLog;
  const PerformanceProblemLog._();

  factory PerformanceProblemLog.fromJson(Map<String, dynamic> json) =>
      _$PerformanceProblemLogFromJson(json);

  /// 正答数
  int get correctCount {
    return performanceProblems.fold<int>(
        0, (previousValue, element) => previousValue + element.correctCount);
  }

  /// 誤答数
  int get incorrectCount {
    return performanceProblems.fold<int>(
        0, (previousValue, element) => previousValue + element.incorrectCount);
  }

  /// 正解率
  double get correctRate {
    return correctCount / (correctCount + incorrectCount);
  }
}
