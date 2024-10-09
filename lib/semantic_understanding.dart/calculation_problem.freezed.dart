// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_problem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalculationProblem _$CalculationProblemFromJson(Map<String, dynamic> json) {
  return _CalculationProblem.fromJson(json);
}

/// @nodoc
mixin _$CalculationProblem {
  String get question => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int get answer => throw _privateConstructorUsedError;
  int? get userAns => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get answeredAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalculationProblemCopyWith<CalculationProblem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationProblemCopyWith<$Res> {
  factory $CalculationProblemCopyWith(
          CalculationProblem value, $Res Function(CalculationProblem) then) =
      _$CalculationProblemCopyWithImpl<$Res, CalculationProblem>;
  @useResult
  $Res call(
      {String question,
      String unit,
      int answer,
      int? userAns,
      DateTime? startedAt,
      DateTime? answeredAt});
}

/// @nodoc
class _$CalculationProblemCopyWithImpl<$Res, $Val extends CalculationProblem>
    implements $CalculationProblemCopyWith<$Res> {
  _$CalculationProblemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? unit = null,
    Object? answer = null,
    Object? userAns = freezed,
    Object? startedAt = freezed,
    Object? answeredAt = freezed,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      userAns: freezed == userAns
          ? _value.userAns
          : userAns // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      answeredAt: freezed == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculationProblemImplCopyWith<$Res>
    implements $CalculationProblemCopyWith<$Res> {
  factory _$$CalculationProblemImplCopyWith(_$CalculationProblemImpl value,
          $Res Function(_$CalculationProblemImpl) then) =
      __$$CalculationProblemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String question,
      String unit,
      int answer,
      int? userAns,
      DateTime? startedAt,
      DateTime? answeredAt});
}

/// @nodoc
class __$$CalculationProblemImplCopyWithImpl<$Res>
    extends _$CalculationProblemCopyWithImpl<$Res, _$CalculationProblemImpl>
    implements _$$CalculationProblemImplCopyWith<$Res> {
  __$$CalculationProblemImplCopyWithImpl(_$CalculationProblemImpl _value,
      $Res Function(_$CalculationProblemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? unit = null,
    Object? answer = null,
    Object? userAns = freezed,
    Object? startedAt = freezed,
    Object? answeredAt = freezed,
  }) {
    return _then(_$CalculationProblemImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      userAns: freezed == userAns
          ? _value.userAns
          : userAns // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      answeredAt: freezed == answeredAt
          ? _value.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculationProblemImpl extends _CalculationProblem {
  _$CalculationProblemImpl(
      {required this.question,
      required this.unit,
      required this.answer,
      this.userAns,
      this.startedAt,
      this.answeredAt})
      : super._();

  factory _$CalculationProblemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculationProblemImplFromJson(json);

  @override
  final String question;
  @override
  final String unit;
  @override
  final int answer;
  @override
  final int? userAns;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? answeredAt;

  @override
  String toString() {
    return 'CalculationProblem(question: $question, unit: $unit, answer: $answer, userAns: $userAns, startedAt: $startedAt, answeredAt: $answeredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationProblemImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.userAns, userAns) || other.userAns == userAns) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, question, unit, answer, userAns, startedAt, answeredAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationProblemImplCopyWith<_$CalculationProblemImpl> get copyWith =>
      __$$CalculationProblemImplCopyWithImpl<_$CalculationProblemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculationProblemImplToJson(
      this,
    );
  }
}

abstract class _CalculationProblem extends CalculationProblem {
  factory _CalculationProblem(
      {required final String question,
      required final String unit,
      required final int answer,
      final int? userAns,
      final DateTime? startedAt,
      final DateTime? answeredAt}) = _$CalculationProblemImpl;
  _CalculationProblem._() : super._();

  factory _CalculationProblem.fromJson(Map<String, dynamic> json) =
      _$CalculationProblemImpl.fromJson;

  @override
  String get question;
  @override
  String get unit;
  @override
  int get answer;
  @override
  int? get userAns;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get answeredAt;
  @override
  @JsonKey(ignore: true)
  _$$CalculationProblemImplCopyWith<_$CalculationProblemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
