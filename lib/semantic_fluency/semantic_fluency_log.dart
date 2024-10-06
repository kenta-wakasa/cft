import 'package:cft/semantic_fluency/answer_word_with_timestamp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'semantic_fluency_log.freezed.dart';
part 'semantic_fluency_log.g.dart';

@freezed
class SemanticFluencyLog with _$SemanticFluencyLog {
  factory SemanticFluencyLog({
    required String id,
    required DateTime startedAt,
    required String userId,
    @Default([]) List<AnswerWordWithTimestamp> answerWordWithTimestampList,
  }) = _SemanticFluencyLog;
  const SemanticFluencyLog._();

  factory SemanticFluencyLog.fromJson(Map<String, dynamic> json) =>
      _$SemanticFluencyLogFromJson(json);
}
