import 'package:cft/semantic_understanding.dart/meaning_problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meaning_problem_log.freezed.dart';
part 'meaning_problem_log.g.dart';

@freezed
class MeaningProblemLog with _$MeaningProblemLog {
  factory MeaningProblemLog({
    required String uid,
    required List<MeaningProblem> meaningProblems,
  }) = _MeaningProblemLog;
  const MeaningProblemLog._();

  factory MeaningProblemLog.fromJson(Map<String, dynamic> json) =>
      _$MeaningProblemLogFromJson(json);
}
