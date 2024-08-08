import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_attention_problem.freezed.dart';
part 'select_attention_problem.g.dart';

@freezed
class SelectAttentionProblem with _$SelectAttentionProblem {
  factory SelectAttentionProblem({
    required List<String> targetWords,
    required List<String> textData,
    @Default({}) Set<int> userAnswerIndexes,
  }) = _SelectAttentionProblem;
  const SelectAttentionProblem._();

  factory SelectAttentionProblem.fromJson(Map<String, dynamic> json) =>
      _$SelectAttentionProblemFromJson(json);

  /// 正解のindexのリスト
  Set<int> get correctIndexes {
    final correctIndexes = <int>{};
    for (final (index, text) in textData.indexed) {
      if (targetWords.contains(text)) {
        correctIndexes.add(index);
      }
    }
    return correctIndexes;
  }

  /// 正解の単語数
  int get correctCount => correctIndexes.length;

  /// 正解数
  int get correctAnswerCount =>
      userAnswerIndexes.intersection(correctIndexes).length;

  /// 誤答数
  int get incorrectAnswerCount =>
      userAnswerIndexes.difference(correctIndexes).length;

  /// 正解率
  double get correctRate => correctAnswerCount / correctCount;
}
