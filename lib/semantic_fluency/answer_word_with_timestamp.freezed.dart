// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_word_with_timestamp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnswerWordWithTimestamp _$AnswerWordWithTimestampFromJson(
    Map<String, dynamic> json) {
  return _AnswerWordWithTimestamp.fromJson(json);
}

/// @nodoc
mixin _$AnswerWordWithTimestamp {
  String get word => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerWordWithTimestampCopyWith<AnswerWordWithTimestamp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerWordWithTimestampCopyWith<$Res> {
  factory $AnswerWordWithTimestampCopyWith(AnswerWordWithTimestamp value,
          $Res Function(AnswerWordWithTimestamp) then) =
      _$AnswerWordWithTimestampCopyWithImpl<$Res, AnswerWordWithTimestamp>;
  @useResult
  $Res call({String word, DateTime timestamp});
}

/// @nodoc
class _$AnswerWordWithTimestampCopyWithImpl<$Res,
        $Val extends AnswerWordWithTimestamp>
    implements $AnswerWordWithTimestampCopyWith<$Res> {
  _$AnswerWordWithTimestampCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerWordWithTimestampImplCopyWith<$Res>
    implements $AnswerWordWithTimestampCopyWith<$Res> {
  factory _$$AnswerWordWithTimestampImplCopyWith(
          _$AnswerWordWithTimestampImpl value,
          $Res Function(_$AnswerWordWithTimestampImpl) then) =
      __$$AnswerWordWithTimestampImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String word, DateTime timestamp});
}

/// @nodoc
class __$$AnswerWordWithTimestampImplCopyWithImpl<$Res>
    extends _$AnswerWordWithTimestampCopyWithImpl<$Res,
        _$AnswerWordWithTimestampImpl>
    implements _$$AnswerWordWithTimestampImplCopyWith<$Res> {
  __$$AnswerWordWithTimestampImplCopyWithImpl(
      _$AnswerWordWithTimestampImpl _value,
      $Res Function(_$AnswerWordWithTimestampImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? timestamp = null,
  }) {
    return _then(_$AnswerWordWithTimestampImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerWordWithTimestampImpl extends _AnswerWordWithTimestamp {
  _$AnswerWordWithTimestampImpl({required this.word, required this.timestamp})
      : super._();

  factory _$AnswerWordWithTimestampImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerWordWithTimestampImplFromJson(json);

  @override
  final String word;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'AnswerWordWithTimestamp(word: $word, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerWordWithTimestampImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, word, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerWordWithTimestampImplCopyWith<_$AnswerWordWithTimestampImpl>
      get copyWith => __$$AnswerWordWithTimestampImplCopyWithImpl<
          _$AnswerWordWithTimestampImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerWordWithTimestampImplToJson(
      this,
    );
  }
}

abstract class _AnswerWordWithTimestamp extends AnswerWordWithTimestamp {
  factory _AnswerWordWithTimestamp(
      {required final String word,
      required final DateTime timestamp}) = _$AnswerWordWithTimestampImpl;
  _AnswerWordWithTimestamp._() : super._();

  factory _AnswerWordWithTimestamp.fromJson(Map<String, dynamic> json) =
      _$AnswerWordWithTimestampImpl.fromJson;

  @override
  String get word;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$AnswerWordWithTimestampImplCopyWith<_$AnswerWordWithTimestampImpl>
      get copyWith => throw _privateConstructorUsedError;
}
