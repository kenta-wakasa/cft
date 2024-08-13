// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_attention_problem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectAttentionProblem _$SelectAttentionProblemFromJson(
    Map<String, dynamic> json) {
  return _SelectAttentionProblem.fromJson(json);
}

/// @nodoc
mixin _$SelectAttentionProblem {
  String get id => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get endAt => throw _privateConstructorUsedError;
  List<String> get targetWords => throw _privateConstructorUsedError;
  List<String> get textData => throw _privateConstructorUsedError;
  Set<int> get userAnswerIndexes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectAttentionProblemCopyWith<SelectAttentionProblem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectAttentionProblemCopyWith<$Res> {
  factory $SelectAttentionProblemCopyWith(SelectAttentionProblem value,
          $Res Function(SelectAttentionProblem) then) =
      _$SelectAttentionProblemCopyWithImpl<$Res, SelectAttentionProblem>;
  @useResult
  $Res call(
      {String id,
      DateTime? startedAt,
      DateTime? endAt,
      List<String> targetWords,
      List<String> textData,
      Set<int> userAnswerIndexes});
}

/// @nodoc
class _$SelectAttentionProblemCopyWithImpl<$Res,
        $Val extends SelectAttentionProblem>
    implements $SelectAttentionProblemCopyWith<$Res> {
  _$SelectAttentionProblemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startedAt = freezed,
    Object? endAt = freezed,
    Object? targetWords = null,
    Object? textData = null,
    Object? userAnswerIndexes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      targetWords: null == targetWords
          ? _value.targetWords
          : targetWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      textData: null == textData
          ? _value.textData
          : textData // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userAnswerIndexes: null == userAnswerIndexes
          ? _value.userAnswerIndexes
          : userAnswerIndexes // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectAttentionProblemImplCopyWith<$Res>
    implements $SelectAttentionProblemCopyWith<$Res> {
  factory _$$SelectAttentionProblemImplCopyWith(
          _$SelectAttentionProblemImpl value,
          $Res Function(_$SelectAttentionProblemImpl) then) =
      __$$SelectAttentionProblemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime? startedAt,
      DateTime? endAt,
      List<String> targetWords,
      List<String> textData,
      Set<int> userAnswerIndexes});
}

/// @nodoc
class __$$SelectAttentionProblemImplCopyWithImpl<$Res>
    extends _$SelectAttentionProblemCopyWithImpl<$Res,
        _$SelectAttentionProblemImpl>
    implements _$$SelectAttentionProblemImplCopyWith<$Res> {
  __$$SelectAttentionProblemImplCopyWithImpl(
      _$SelectAttentionProblemImpl _value,
      $Res Function(_$SelectAttentionProblemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startedAt = freezed,
    Object? endAt = freezed,
    Object? targetWords = null,
    Object? textData = null,
    Object? userAnswerIndexes = null,
  }) {
    return _then(_$SelectAttentionProblemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      targetWords: null == targetWords
          ? _value._targetWords
          : targetWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      textData: null == textData
          ? _value._textData
          : textData // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userAnswerIndexes: null == userAnswerIndexes
          ? _value._userAnswerIndexes
          : userAnswerIndexes // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectAttentionProblemImpl extends _SelectAttentionProblem {
  _$SelectAttentionProblemImpl(
      {required this.id,
      this.startedAt,
      this.endAt,
      required final List<String> targetWords,
      required final List<String> textData,
      final Set<int> userAnswerIndexes = const {}})
      : _targetWords = targetWords,
        _textData = textData,
        _userAnswerIndexes = userAnswerIndexes,
        super._();

  factory _$SelectAttentionProblemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectAttentionProblemImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? endAt;
  final List<String> _targetWords;
  @override
  List<String> get targetWords {
    if (_targetWords is EqualUnmodifiableListView) return _targetWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetWords);
  }

  final List<String> _textData;
  @override
  List<String> get textData {
    if (_textData is EqualUnmodifiableListView) return _textData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textData);
  }

  final Set<int> _userAnswerIndexes;
  @override
  @JsonKey()
  Set<int> get userAnswerIndexes {
    if (_userAnswerIndexes is EqualUnmodifiableSetView)
      return _userAnswerIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_userAnswerIndexes);
  }

  @override
  String toString() {
    return 'SelectAttentionProblem(id: $id, startedAt: $startedAt, endAt: $endAt, targetWords: $targetWords, textData: $textData, userAnswerIndexes: $userAnswerIndexes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAttentionProblemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            const DeepCollectionEquality()
                .equals(other._targetWords, _targetWords) &&
            const DeepCollectionEquality().equals(other._textData, _textData) &&
            const DeepCollectionEquality()
                .equals(other._userAnswerIndexes, _userAnswerIndexes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      startedAt,
      endAt,
      const DeepCollectionEquality().hash(_targetWords),
      const DeepCollectionEquality().hash(_textData),
      const DeepCollectionEquality().hash(_userAnswerIndexes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAttentionProblemImplCopyWith<_$SelectAttentionProblemImpl>
      get copyWith => __$$SelectAttentionProblemImplCopyWithImpl<
          _$SelectAttentionProblemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectAttentionProblemImplToJson(
      this,
    );
  }
}

abstract class _SelectAttentionProblem extends SelectAttentionProblem {
  factory _SelectAttentionProblem(
      {required final String id,
      final DateTime? startedAt,
      final DateTime? endAt,
      required final List<String> targetWords,
      required final List<String> textData,
      final Set<int> userAnswerIndexes}) = _$SelectAttentionProblemImpl;
  _SelectAttentionProblem._() : super._();

  factory _SelectAttentionProblem.fromJson(Map<String, dynamic> json) =
      _$SelectAttentionProblemImpl.fromJson;

  @override
  String get id;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get endAt;
  @override
  List<String> get targetWords;
  @override
  List<String> get textData;
  @override
  Set<int> get userAnswerIndexes;
  @override
  @JsonKey(ignore: true)
  _$$SelectAttentionProblemImplCopyWith<_$SelectAttentionProblemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
