// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple_arithmetic_problem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SimpleArithmeticProblem _$SimpleArithmeticProblemFromJson(
    Map<String, dynamic> json) {
  return _SimpleArithmeticProblem.fromJson(json);
}

/// @nodoc
mixin _$SimpleArithmeticProblem {
  int get a => throw _privateConstructorUsedError;
  int get b => throw _privateConstructorUsedError;
  Operator get randomOperator => throw _privateConstructorUsedError;
  int? get userAnswer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleArithmeticProblemCopyWith<SimpleArithmeticProblem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleArithmeticProblemCopyWith<$Res> {
  factory $SimpleArithmeticProblemCopyWith(SimpleArithmeticProblem value,
          $Res Function(SimpleArithmeticProblem) then) =
      _$SimpleArithmeticProblemCopyWithImpl<$Res, SimpleArithmeticProblem>;
  @useResult
  $Res call({int a, int b, Operator randomOperator, int? userAnswer});
}

/// @nodoc
class _$SimpleArithmeticProblemCopyWithImpl<$Res,
        $Val extends SimpleArithmeticProblem>
    implements $SimpleArithmeticProblemCopyWith<$Res> {
  _$SimpleArithmeticProblemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? b = null,
    Object? randomOperator = null,
    Object? userAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      b: null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
      randomOperator: null == randomOperator
          ? _value.randomOperator
          : randomOperator // ignore: cast_nullable_to_non_nullable
              as Operator,
      userAnswer: freezed == userAnswer
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SimpleArithmeticProblemImplCopyWith<$Res>
    implements $SimpleArithmeticProblemCopyWith<$Res> {
  factory _$$SimpleArithmeticProblemImplCopyWith(
          _$SimpleArithmeticProblemImpl value,
          $Res Function(_$SimpleArithmeticProblemImpl) then) =
      __$$SimpleArithmeticProblemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int a, int b, Operator randomOperator, int? userAnswer});
}

/// @nodoc
class __$$SimpleArithmeticProblemImplCopyWithImpl<$Res>
    extends _$SimpleArithmeticProblemCopyWithImpl<$Res,
        _$SimpleArithmeticProblemImpl>
    implements _$$SimpleArithmeticProblemImplCopyWith<$Res> {
  __$$SimpleArithmeticProblemImplCopyWithImpl(
      _$SimpleArithmeticProblemImpl _value,
      $Res Function(_$SimpleArithmeticProblemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? b = null,
    Object? randomOperator = null,
    Object? userAnswer = freezed,
  }) {
    return _then(_$SimpleArithmeticProblemImpl(
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      b: null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
      randomOperator: null == randomOperator
          ? _value.randomOperator
          : randomOperator // ignore: cast_nullable_to_non_nullable
              as Operator,
      userAnswer: freezed == userAnswer
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleArithmeticProblemImpl extends _SimpleArithmeticProblem {
  _$SimpleArithmeticProblemImpl(
      {required this.a,
      required this.b,
      required this.randomOperator,
      this.userAnswer})
      : super._();

  factory _$SimpleArithmeticProblemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleArithmeticProblemImplFromJson(json);

  @override
  final int a;
  @override
  final int b;
  @override
  final Operator randomOperator;
  @override
  final int? userAnswer;

  @override
  String toString() {
    return 'SimpleArithmeticProblem(a: $a, b: $b, randomOperator: $randomOperator, userAnswer: $userAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleArithmeticProblemImpl &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.b, b) || other.b == b) &&
            (identical(other.randomOperator, randomOperator) ||
                other.randomOperator == randomOperator) &&
            (identical(other.userAnswer, userAnswer) ||
                other.userAnswer == userAnswer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, a, b, randomOperator, userAnswer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleArithmeticProblemImplCopyWith<_$SimpleArithmeticProblemImpl>
      get copyWith => __$$SimpleArithmeticProblemImplCopyWithImpl<
          _$SimpleArithmeticProblemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleArithmeticProblemImplToJson(
      this,
    );
  }
}

abstract class _SimpleArithmeticProblem extends SimpleArithmeticProblem {
  factory _SimpleArithmeticProblem(
      {required final int a,
      required final int b,
      required final Operator randomOperator,
      final int? userAnswer}) = _$SimpleArithmeticProblemImpl;
  _SimpleArithmeticProblem._() : super._();

  factory _SimpleArithmeticProblem.fromJson(Map<String, dynamic> json) =
      _$SimpleArithmeticProblemImpl.fromJson;

  @override
  int get a;
  @override
  int get b;
  @override
  Operator get randomOperator;
  @override
  int? get userAnswer;
  @override
  @JsonKey(ignore: true)
  _$$SimpleArithmeticProblemImplCopyWith<_$SimpleArithmeticProblemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
