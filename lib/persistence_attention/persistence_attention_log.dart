import 'package:cft/persistence_attention/simple_arithmetic_problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'persistence_attention_log.freezed.dart';
part 'persistence_attention_log.g.dart';

@freezed
class PersistenceAttentionLog with _$PersistenceAttentionLog {
  factory PersistenceAttentionLog({
    required String id,
    required String? documentId,
    required DateTime startedAt,
    required String userId,
    required List<SimpleArithmeticProblem> problems,
  }) = _PersistenceAttentionLog;
  const PersistenceAttentionLog._();

  factory PersistenceAttentionLog.fromJson(Map<String, dynamic> json) =>
      _$PersistenceAttentionLogFromJson(json);

  /// valid answers
  List<SimpleArithmeticProblem> get validAnswers =>
      problems.where((problem) => problem.userAnswer != null).toList();

  /// 正解数
  int get correctCount =>
      validAnswers.where((problem) => problem.isCorrect).length;

  /// 誤答数
  int get incorrectCount =>
      validAnswers.where((problem) => !problem.isCorrect).length;

  /// 正解率
  double get correctRate =>
      validAnswers.isEmpty ? 0 : correctCount / validAnswers.length;

  /// 経過時間ミリセカンド
  int elapsedMilliSeconds(int index) {
    final DateTime? start;
    final DateTime? end;
    if (index == 0) {
      start = startedAt;
      end = problems[index].answeredAt;
    } else {
      start = problems[index - 1].answeredAt;
      end = problems[index].answeredAt;
    }
    if (start == null || end == null) {
      return 0;
    }
    return end.difference(start).inMilliseconds;
  }
}
