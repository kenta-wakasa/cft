import 'package:cft/performance/graph.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'performance_problem.freezed.dart';
part 'performance_problem.g.dart';

@freezed
class PerformanceProblem with _$PerformanceProblem {
  factory PerformanceProblem({
    required Graph graph,
    required List<String> questionTexts,

    /// S→A→G みたいな感じ
    required List<String> answerTexts,
    @Default([]) List<String> userAnswers,
    DateTime? startedAt,
    @Default([]) List<DateTime> answeredAtList,
  }) = _PerformanceProblem;
  const PerformanceProblem._();

  factory PerformanceProblem.fromJson(Map<String, dynamic> json) =>
      _$PerformanceProblemFromJson(json);

  /// 正解数
  int get correctCount {
    return List.generate(answerTexts.length, (index) {
      return answerTexts[index] == userAnswers[index];
    }).where((element) => element).length;
  }

  /// 誤答数
  int get incorrectCount {
    return List.generate(answerTexts.length, (index) {
      return answerTexts[index] == userAnswers[index];
    }).where((element) => !element).length;
  }

  /// 経過時間ms
  int elapsedTime(int index) {
    if (index == 0) {
      if (startedAt == null) {
        return 0;
      }
      return startedAt!.difference(answeredAtList[index]).inMilliseconds;
    }
    return answeredAtList[index]
        .difference(answeredAtList[index - 1])
        .inMilliseconds;
  }
}
