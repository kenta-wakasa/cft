import 'package:cft/semantic_fluency/answer_word_with_timestamp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'semantic_fluency_log.freezed.dart';
part 'semantic_fluency_log.g.dart';

@freezed
class SemanticFluencyLog with _$SemanticFluencyLog {
  factory SemanticFluencyLog({
    required String id,
    required String? documentId,
    required DateTime startedAt,
    required String userId,
    @Default([]) List<AnswerWordWithTimestamp> answerWordWithTimestampList,
    @Default('') String theme,
  }) = _SemanticFluencyLog;
  const SemanticFluencyLog._();

  factory SemanticFluencyLog.fromJson(Map<String, dynamic> json) =>
      _$SemanticFluencyLogFromJson(json);

  /// 経過時間ms
  int elapsedTime(int index) {
    if (index == 0) {
      return answerWordWithTimestampList[index]
          .timestamp
          .difference(startedAt)
          .inMilliseconds;
    }
    return answerWordWithTimestampList[index]
        .timestamp
        .difference(answerWordWithTimestampList[index - 1].timestamp)
        .inMilliseconds;
  }
}
