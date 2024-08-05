// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persistence_attention_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersistenceAttentionState _$PersistenceAttentionStateFromJson(
    Map<String, dynamic> json) {
  return _PersistenceAttentionState.fromJson(json);
}

/// @nodoc
mixin _$PersistenceAttentionState {
  bool get isPlaying => throw _privateConstructorUsedError;
  List<SimpleArithmeticProblem> get problems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersistenceAttentionStateCopyWith<PersistenceAttentionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersistenceAttentionStateCopyWith<$Res> {
  factory $PersistenceAttentionStateCopyWith(PersistenceAttentionState value,
          $Res Function(PersistenceAttentionState) then) =
      _$PersistenceAttentionStateCopyWithImpl<$Res, PersistenceAttentionState>;
  @useResult
  $Res call({bool isPlaying, List<SimpleArithmeticProblem> problems});
}

/// @nodoc
class _$PersistenceAttentionStateCopyWithImpl<$Res,
        $Val extends PersistenceAttentionState>
    implements $PersistenceAttentionStateCopyWith<$Res> {
  _$PersistenceAttentionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? problems = null,
  }) {
    return _then(_value.copyWith(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      problems: null == problems
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<SimpleArithmeticProblem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersistenceAttentionStateImplCopyWith<$Res>
    implements $PersistenceAttentionStateCopyWith<$Res> {
  factory _$$PersistenceAttentionStateImplCopyWith(
          _$PersistenceAttentionStateImpl value,
          $Res Function(_$PersistenceAttentionStateImpl) then) =
      __$$PersistenceAttentionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPlaying, List<SimpleArithmeticProblem> problems});
}

/// @nodoc
class __$$PersistenceAttentionStateImplCopyWithImpl<$Res>
    extends _$PersistenceAttentionStateCopyWithImpl<$Res,
        _$PersistenceAttentionStateImpl>
    implements _$$PersistenceAttentionStateImplCopyWith<$Res> {
  __$$PersistenceAttentionStateImplCopyWithImpl(
      _$PersistenceAttentionStateImpl _value,
      $Res Function(_$PersistenceAttentionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlaying = null,
    Object? problems = null,
  }) {
    return _then(_$PersistenceAttentionStateImpl(
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      problems: null == problems
          ? _value._problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<SimpleArithmeticProblem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersistenceAttentionStateImpl extends _PersistenceAttentionState {
  _$PersistenceAttentionStateImpl(
      {required this.isPlaying,
      required final List<SimpleArithmeticProblem> problems})
      : _problems = problems,
        super._();

  factory _$PersistenceAttentionStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersistenceAttentionStateImplFromJson(json);

  @override
  final bool isPlaying;
  final List<SimpleArithmeticProblem> _problems;
  @override
  List<SimpleArithmeticProblem> get problems {
    if (_problems is EqualUnmodifiableListView) return _problems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problems);
  }

  @override
  String toString() {
    return 'PersistenceAttentionState(isPlaying: $isPlaying, problems: $problems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersistenceAttentionStateImpl &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            const DeepCollectionEquality().equals(other._problems, _problems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, isPlaying, const DeepCollectionEquality().hash(_problems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersistenceAttentionStateImplCopyWith<_$PersistenceAttentionStateImpl>
      get copyWith => __$$PersistenceAttentionStateImplCopyWithImpl<
          _$PersistenceAttentionStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersistenceAttentionStateImplToJson(
      this,
    );
  }
}

abstract class _PersistenceAttentionState extends PersistenceAttentionState {
  factory _PersistenceAttentionState(
          {required final bool isPlaying,
          required final List<SimpleArithmeticProblem> problems}) =
      _$PersistenceAttentionStateImpl;
  _PersistenceAttentionState._() : super._();

  factory _PersistenceAttentionState.fromJson(Map<String, dynamic> json) =
      _$PersistenceAttentionStateImpl.fromJson;

  @override
  bool get isPlaying;
  @override
  List<SimpleArithmeticProblem> get problems;
  @override
  @JsonKey(ignore: true)
  _$$PersistenceAttentionStateImplCopyWith<_$PersistenceAttentionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
