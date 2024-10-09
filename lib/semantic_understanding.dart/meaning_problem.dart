import 'package:freezed_annotation/freezed_annotation.dart';

part 'meaning_problem.freezed.dart';
part 'meaning_problem.g.dart';

@freezed
class MeaningProblem with _$MeaningProblem {
  factory MeaningProblem({
    required String question,
    required List<String> commonReasons,
    required Difficulty difficulty,
    @Default('') String userAns,
    DateTime? startedAt,
    DateTime? answeredAt,
  }) = _MeaningProblem;
  const MeaningProblem._();

  factory MeaningProblem.fromJson(Map<String, dynamic> json) =>
      _$MeaningProblemFromJson(json);
}

/// 難易度
enum Difficulty {
  easy,
  normal,
  hard,
}
