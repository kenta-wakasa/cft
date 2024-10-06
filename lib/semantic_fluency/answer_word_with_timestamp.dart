import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_word_with_timestamp.freezed.dart';
part 'answer_word_with_timestamp.g.dart';

@freezed
class AnswerWordWithTimestamp with _$AnswerWordWithTimestamp {
  factory AnswerWordWithTimestamp({
    required String word,
    required DateTime timestamp,
  }) = _AnswerWordWithTimestamp;
  const AnswerWordWithTimestamp._();

  factory AnswerWordWithTimestamp.fromJson(Map<String, dynamic> json) =>
      _$AnswerWordWithTimestampFromJson(json);
}
