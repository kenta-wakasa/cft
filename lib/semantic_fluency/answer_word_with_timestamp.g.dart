// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_word_with_timestamp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerWordWithTimestampImpl _$$AnswerWordWithTimestampImplFromJson(
        Map<String, dynamic> json) =>
    _$AnswerWordWithTimestampImpl(
      word: json['word'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$AnswerWordWithTimestampImplToJson(
        _$AnswerWordWithTimestampImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'timestamp': instance.timestamp.toIso8601String(),
    };
