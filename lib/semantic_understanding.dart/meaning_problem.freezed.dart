// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meaning_problem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MeaningProblem _$MeaningProblemFromJson(Map<String, dynamic> json) {
  return _MeaningProblem.fromJson(json);
}

/// @nodoc
mixin _$MeaningProblem {
  String get question => throw _privateConstructorUsedError;
  List<String> get commonReasons => throw _privateConstructorUsedError;
  Difficulty get difficulty => throw _privateConstructorUsedError;
  String get userAns => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get answeredAt => throw _privateConstructorUsedError;

  /// 得点 (0-2) 人が後で採点する
  int? get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeaningProblemCopyWith<MeaningProblem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeaningProblemCopyWith<$Res> {
  factory $MeaningProblemCopyWith(
          MeaningProblem value, $Res Function(MeaningProblem) then) =
      _$MeaningProblemCopyWithImpl<$Res, MeaningProblem>;
  @useResult
  $Res call(
      {String question,
      List<String> commonReasons,
      Difficulty difficulty,
      String userAns,
      DateTime? startedAt,
      DateTime? answeredAt,
      int? score});
}

/// @nodoc
class _$MeaningProblemCopyWithImpl<$Res, $Val extends MeaningProblem>
    implements $MeaningProblemCopyWith<$Res> {
  _$MeaningProblemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? commonReasons = null,
    Object? difficulty = null,
    Object? userAns = null,
    Object? startedAt = freezed,
    Object? answeredAt = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      commonReasons: null == commonReasons
          ? _value.commonReasons
          : commonReasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      userAns: null == userAns
          ? _value.userAns
          : userAns // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      answeredAt: freezed == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeaningProblemImplCopyWith<$Res>
    implements $MeaningProblemCopyWith<$Res> {
  factory _$$MeaningProblemImplCopyWith(_$MeaningProblemImpl value,
          $Res Function(_$MeaningProblemImpl) then) =
      __$$MeaningProblemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String question,
      List<String> commonReasons,
      Difficulty difficulty,
      String userAns,
      DateTime? startedAt,
      DateTime? answeredAt,
      int? score});
}

/// @nodoc
class __$$MeaningProblemImplCopyWithImpl<$Res>
    extends _$MeaningProblemCopyWithImpl<$Res, _$MeaningProblemImpl>
    implements _$$MeaningProblemImplCopyWith<$Res> {
  __$$MeaningProblemImplCopyWithImpl(
      _$MeaningProblemImpl _value, $Res Function(_$MeaningProblemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? commonReasons = null,
    Object? difficulty = null,
    Object? userAns = null,
    Object? startedAt = freezed,
    Object? answeredAt = freezed,
    Object? score = freezed,
  }) {
    return _then(_$MeaningProblemImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      commonReasons: null == commonReasons
          ? _value._commonReasons
          : commonReasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      userAns: null == userAns
          ? _value.userAns
          : userAns // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      answeredAt: freezed == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeaningProblemImpl extends _MeaningProblem {
  _$MeaningProblemImpl(
      {required this.question,
      required final List<String> commonReasons,
      required this.difficulty,
      this.userAns = '',
      this.startedAt,
      this.answeredAt,
      this.score})
      : _commonReasons = commonReasons,
        super._();

  factory _$MeaningProblemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeaningProblemImplFromJson(json);

  @override
  final String question;
  final List<String> _commonReasons;
  @override
  List<String> get commonReasons {
    if (_commonReasons is EqualUnmodifiableListView) return _commonReasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonReasons);
  }

  @override
  final Difficulty difficulty;
  @override
  @JsonKey()
  final String userAns;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? answeredAt;

  /// 得点 (0-2) 人が後で採点する
  @override
  final int? score;

  @override
  String toString() {
    return 'MeaningProblem(question: $question, commonReasons: $commonReasons, difficulty: $difficulty, userAns: $userAns, startedAt: $startedAt, answeredAt: $answeredAt, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeaningProblemImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality()
                .equals(other._commonReasons, _commonReasons) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.userAns, userAns) || other.userAns == userAns) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      question,
      const DeepCollectionEquality().hash(_commonReasons),
      difficulty,
      userAns,
      startedAt,
      answeredAt,
      score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeaningProblemImplCopyWith<_$MeaningProblemImpl> get copyWith =>
      __$$MeaningProblemImplCopyWithImpl<_$MeaningProblemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeaningProblemImplToJson(
      this,
    );
  }
}

abstract class _MeaningProblem extends MeaningProblem {
  factory _MeaningProblem(
      {required final String question,
      required final List<String> commonReasons,
      required final Difficulty difficulty,
      final String userAns,
      final DateTime? startedAt,
      final DateTime? answeredAt,
      final int? score}) = _$MeaningProblemImpl;
  _MeaningProblem._() : super._();

  factory _MeaningProblem.fromJson(Map<String, dynamic> json) =
      _$MeaningProblemImpl.fromJson;

  @override
  String get question;
  @override
  List<String> get commonReasons;
  @override
  Difficulty get difficulty;
  @override
  String get userAns;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get answeredAt;
  @override

  /// 得点 (0-2) 人が後で採点する
  int? get score;
  @override
  @JsonKey(ignore: true)
  _$$MeaningProblemImplCopyWith<_$MeaningProblemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
