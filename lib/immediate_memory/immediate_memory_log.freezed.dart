// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'immediate_memory_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImmediateMemoryLog _$ImmediateMemoryLogFromJson(Map<String, dynamic> json) {
  return _ImmediateMemoryLog.fromJson(json);
}

/// @nodoc
mixin _$ImmediateMemoryLog {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  ImmediateMemoryProblem get immediateMemoryProblem =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImmediateMemoryLogCopyWith<ImmediateMemoryLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImmediateMemoryLogCopyWith<$Res> {
  factory $ImmediateMemoryLogCopyWith(
          ImmediateMemoryLog value, $Res Function(ImmediateMemoryLog) then) =
      _$ImmediateMemoryLogCopyWithImpl<$Res, ImmediateMemoryLog>;
  @useResult
  $Res call(
      {String id,
      String userId,
      ImmediateMemoryProblem immediateMemoryProblem});

  $ImmediateMemoryProblemCopyWith<$Res> get immediateMemoryProblem;
}

/// @nodoc
class _$ImmediateMemoryLogCopyWithImpl<$Res, $Val extends ImmediateMemoryLog>
    implements $ImmediateMemoryLogCopyWith<$Res> {
  _$ImmediateMemoryLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? immediateMemoryProblem = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      immediateMemoryProblem: null == immediateMemoryProblem
          ? _value.immediateMemoryProblem
          : immediateMemoryProblem // ignore: cast_nullable_to_non_nullable
              as ImmediateMemoryProblem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImmediateMemoryProblemCopyWith<$Res> get immediateMemoryProblem {
    return $ImmediateMemoryProblemCopyWith<$Res>(_value.immediateMemoryProblem,
        (value) {
      return _then(_value.copyWith(immediateMemoryProblem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImmediateMemoryLogImplCopyWith<$Res>
    implements $ImmediateMemoryLogCopyWith<$Res> {
  factory _$$ImmediateMemoryLogImplCopyWith(_$ImmediateMemoryLogImpl value,
          $Res Function(_$ImmediateMemoryLogImpl) then) =
      __$$ImmediateMemoryLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      ImmediateMemoryProblem immediateMemoryProblem});

  @override
  $ImmediateMemoryProblemCopyWith<$Res> get immediateMemoryProblem;
}

/// @nodoc
class __$$ImmediateMemoryLogImplCopyWithImpl<$Res>
    extends _$ImmediateMemoryLogCopyWithImpl<$Res, _$ImmediateMemoryLogImpl>
    implements _$$ImmediateMemoryLogImplCopyWith<$Res> {
  __$$ImmediateMemoryLogImplCopyWithImpl(_$ImmediateMemoryLogImpl _value,
      $Res Function(_$ImmediateMemoryLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? immediateMemoryProblem = null,
  }) {
    return _then(_$ImmediateMemoryLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      immediateMemoryProblem: null == immediateMemoryProblem
          ? _value.immediateMemoryProblem
          : immediateMemoryProblem // ignore: cast_nullable_to_non_nullable
              as ImmediateMemoryProblem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImmediateMemoryLogImpl extends _ImmediateMemoryLog {
  _$ImmediateMemoryLogImpl(
      {required this.id,
      required this.userId,
      required this.immediateMemoryProblem})
      : super._();

  factory _$ImmediateMemoryLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImmediateMemoryLogImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final ImmediateMemoryProblem immediateMemoryProblem;

  @override
  String toString() {
    return 'ImmediateMemoryLog(id: $id, userId: $userId, immediateMemoryProblem: $immediateMemoryProblem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmediateMemoryLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.immediateMemoryProblem, immediateMemoryProblem) ||
                other.immediateMemoryProblem == immediateMemoryProblem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, immediateMemoryProblem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImmediateMemoryLogImplCopyWith<_$ImmediateMemoryLogImpl> get copyWith =>
      __$$ImmediateMemoryLogImplCopyWithImpl<_$ImmediateMemoryLogImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImmediateMemoryLogImplToJson(
      this,
    );
  }
}

abstract class _ImmediateMemoryLog extends ImmediateMemoryLog {
  factory _ImmediateMemoryLog(
          {required final String id,
          required final String userId,
          required final ImmediateMemoryProblem immediateMemoryProblem}) =
      _$ImmediateMemoryLogImpl;
  _ImmediateMemoryLog._() : super._();

  factory _ImmediateMemoryLog.fromJson(Map<String, dynamic> json) =
      _$ImmediateMemoryLogImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  ImmediateMemoryProblem get immediateMemoryProblem;
  @override
  @JsonKey(ignore: true)
  _$$ImmediateMemoryLogImplCopyWith<_$ImmediateMemoryLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
