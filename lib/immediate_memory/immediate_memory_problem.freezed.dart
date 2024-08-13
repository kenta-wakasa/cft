// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'immediate_memory_problem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImmediateMemoryProblem _$ImmediateMemoryProblemFromJson(
    Map<String, dynamic> json) {
  return _ImmediateMemoryProblem.fromJson(json);
}

/// @nodoc
mixin _$ImmediateMemoryProblem {
  List<String> get randomNumbers => throw _privateConstructorUsedError;
  List<String> get userAnswerNumbers => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get endAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImmediateMemoryProblemCopyWith<ImmediateMemoryProblem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImmediateMemoryProblemCopyWith<$Res> {
  factory $ImmediateMemoryProblemCopyWith(ImmediateMemoryProblem value,
          $Res Function(ImmediateMemoryProblem) then) =
      _$ImmediateMemoryProblemCopyWithImpl<$Res, ImmediateMemoryProblem>;
  @useResult
  $Res call(
      {List<String> randomNumbers,
      List<String> userAnswerNumbers,
      DateTime? startedAt,
      DateTime? endAt});
}

/// @nodoc
class _$ImmediateMemoryProblemCopyWithImpl<$Res,
        $Val extends ImmediateMemoryProblem>
    implements $ImmediateMemoryProblemCopyWith<$Res> {
  _$ImmediateMemoryProblemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? randomNumbers = null,
    Object? userAnswerNumbers = null,
    Object? startedAt = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_value.copyWith(
      randomNumbers: null == randomNumbers
          ? _value.randomNumbers
          : randomNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userAnswerNumbers: null == userAnswerNumbers
          ? _value.userAnswerNumbers
          : userAnswerNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImmediateMemoryProblemImplCopyWith<$Res>
    implements $ImmediateMemoryProblemCopyWith<$Res> {
  factory _$$ImmediateMemoryProblemImplCopyWith(
          _$ImmediateMemoryProblemImpl value,
          $Res Function(_$ImmediateMemoryProblemImpl) then) =
      __$$ImmediateMemoryProblemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> randomNumbers,
      List<String> userAnswerNumbers,
      DateTime? startedAt,
      DateTime? endAt});
}

/// @nodoc
class __$$ImmediateMemoryProblemImplCopyWithImpl<$Res>
    extends _$ImmediateMemoryProblemCopyWithImpl<$Res,
        _$ImmediateMemoryProblemImpl>
    implements _$$ImmediateMemoryProblemImplCopyWith<$Res> {
  __$$ImmediateMemoryProblemImplCopyWithImpl(
      _$ImmediateMemoryProblemImpl _value,
      $Res Function(_$ImmediateMemoryProblemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? randomNumbers = null,
    Object? userAnswerNumbers = null,
    Object? startedAt = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_$ImmediateMemoryProblemImpl(
      randomNumbers: null == randomNumbers
          ? _value._randomNumbers
          : randomNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userAnswerNumbers: null == userAnswerNumbers
          ? _value._userAnswerNumbers
          : userAnswerNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImmediateMemoryProblemImpl extends _ImmediateMemoryProblem {
  _$ImmediateMemoryProblemImpl(
      {required final List<String> randomNumbers,
      final List<String> userAnswerNumbers = const [],
      this.startedAt,
      this.endAt})
      : _randomNumbers = randomNumbers,
        _userAnswerNumbers = userAnswerNumbers,
        super._();

  factory _$ImmediateMemoryProblemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImmediateMemoryProblemImplFromJson(json);

  final List<String> _randomNumbers;
  @override
  List<String> get randomNumbers {
    if (_randomNumbers is EqualUnmodifiableListView) return _randomNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_randomNumbers);
  }

  final List<String> _userAnswerNumbers;
  @override
  @JsonKey()
  List<String> get userAnswerNumbers {
    if (_userAnswerNumbers is EqualUnmodifiableListView)
      return _userAnswerNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAnswerNumbers);
  }

  @override
  final DateTime? startedAt;
  @override
  final DateTime? endAt;

  @override
  String toString() {
    return 'ImmediateMemoryProblem(randomNumbers: $randomNumbers, userAnswerNumbers: $userAnswerNumbers, startedAt: $startedAt, endAt: $endAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmediateMemoryProblemImpl &&
            const DeepCollectionEquality()
                .equals(other._randomNumbers, _randomNumbers) &&
            const DeepCollectionEquality()
                .equals(other._userAnswerNumbers, _userAnswerNumbers) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_randomNumbers),
      const DeepCollectionEquality().hash(_userAnswerNumbers),
      startedAt,
      endAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImmediateMemoryProblemImplCopyWith<_$ImmediateMemoryProblemImpl>
      get copyWith => __$$ImmediateMemoryProblemImplCopyWithImpl<
          _$ImmediateMemoryProblemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImmediateMemoryProblemImplToJson(
      this,
    );
  }
}

abstract class _ImmediateMemoryProblem extends ImmediateMemoryProblem {
  factory _ImmediateMemoryProblem(
      {required final List<String> randomNumbers,
      final List<String> userAnswerNumbers,
      final DateTime? startedAt,
      final DateTime? endAt}) = _$ImmediateMemoryProblemImpl;
  _ImmediateMemoryProblem._() : super._();

  factory _ImmediateMemoryProblem.fromJson(Map<String, dynamic> json) =
      _$ImmediateMemoryProblemImpl.fromJson;

  @override
  List<String> get randomNumbers;
  @override
  List<String> get userAnswerNumbers;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get endAt;
  @override
  @JsonKey(ignore: true)
  _$$ImmediateMemoryProblemImplCopyWith<_$ImmediateMemoryProblemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
