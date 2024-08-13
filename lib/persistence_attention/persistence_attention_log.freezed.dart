// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persistence_attention_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersistenceAttentionLog _$PersistenceAttentionLogFromJson(
    Map<String, dynamic> json) {
  return _PersistenceAttentionLog.fromJson(json);
}

/// @nodoc
mixin _$PersistenceAttentionLog {
  String get id => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<SimpleArithmeticProblem> get problems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersistenceAttentionLogCopyWith<PersistenceAttentionLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersistenceAttentionLogCopyWith<$Res> {
  factory $PersistenceAttentionLogCopyWith(PersistenceAttentionLog value,
          $Res Function(PersistenceAttentionLog) then) =
      _$PersistenceAttentionLogCopyWithImpl<$Res, PersistenceAttentionLog>;
  @useResult
  $Res call(
      {String id,
      DateTime startedAt,
      String userId,
      List<SimpleArithmeticProblem> problems});
}

/// @nodoc
class _$PersistenceAttentionLogCopyWithImpl<$Res,
        $Val extends PersistenceAttentionLog>
    implements $PersistenceAttentionLogCopyWith<$Res> {
  _$PersistenceAttentionLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startedAt = null,
    Object? userId = null,
    Object? problems = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      problems: null == problems
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<SimpleArithmeticProblem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersistenceAttentionLogImplCopyWith<$Res>
    implements $PersistenceAttentionLogCopyWith<$Res> {
  factory _$$PersistenceAttentionLogImplCopyWith(
          _$PersistenceAttentionLogImpl value,
          $Res Function(_$PersistenceAttentionLogImpl) then) =
      __$$PersistenceAttentionLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime startedAt,
      String userId,
      List<SimpleArithmeticProblem> problems});
}

/// @nodoc
class __$$PersistenceAttentionLogImplCopyWithImpl<$Res>
    extends _$PersistenceAttentionLogCopyWithImpl<$Res,
        _$PersistenceAttentionLogImpl>
    implements _$$PersistenceAttentionLogImplCopyWith<$Res> {
  __$$PersistenceAttentionLogImplCopyWithImpl(
      _$PersistenceAttentionLogImpl _value,
      $Res Function(_$PersistenceAttentionLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startedAt = null,
    Object? userId = null,
    Object? problems = null,
  }) {
    return _then(_$PersistenceAttentionLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      problems: null == problems
          ? _value._problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<SimpleArithmeticProblem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersistenceAttentionLogImpl extends _PersistenceAttentionLog {
  _$PersistenceAttentionLogImpl(
      {required this.id,
      required this.startedAt,
      required this.userId,
      required final List<SimpleArithmeticProblem> problems})
      : _problems = problems,
        super._();

  factory _$PersistenceAttentionLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersistenceAttentionLogImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime startedAt;
  @override
  final String userId;
  final List<SimpleArithmeticProblem> _problems;
  @override
  List<SimpleArithmeticProblem> get problems {
    if (_problems is EqualUnmodifiableListView) return _problems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problems);
  }

  @override
  String toString() {
    return 'PersistenceAttentionLog(id: $id, startedAt: $startedAt, userId: $userId, problems: $problems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersistenceAttentionLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._problems, _problems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startedAt, userId,
      const DeepCollectionEquality().hash(_problems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersistenceAttentionLogImplCopyWith<_$PersistenceAttentionLogImpl>
      get copyWith => __$$PersistenceAttentionLogImplCopyWithImpl<
          _$PersistenceAttentionLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersistenceAttentionLogImplToJson(
      this,
    );
  }
}

abstract class _PersistenceAttentionLog extends PersistenceAttentionLog {
  factory _PersistenceAttentionLog(
          {required final String id,
          required final DateTime startedAt,
          required final String userId,
          required final List<SimpleArithmeticProblem> problems}) =
      _$PersistenceAttentionLogImpl;
  _PersistenceAttentionLog._() : super._();

  factory _PersistenceAttentionLog.fromJson(Map<String, dynamic> json) =
      _$PersistenceAttentionLogImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get startedAt;
  @override
  String get userId;
  @override
  List<SimpleArithmeticProblem> get problems;
  @override
  @JsonKey(ignore: true)
  _$$PersistenceAttentionLogImplCopyWith<_$PersistenceAttentionLogImpl>
      get copyWith => throw _privateConstructorUsedError;
}
