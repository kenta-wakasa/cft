// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'semantic_fluency_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SemanticFluencyLog _$SemanticFluencyLogFromJson(Map<String, dynamic> json) {
  return _SemanticFluencyLog.fromJson(json);
}

/// @nodoc
mixin _$SemanticFluencyLog {
  String get id => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<AnswerWordWithTimestamp> get answerWordWithTimestampList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SemanticFluencyLogCopyWith<SemanticFluencyLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SemanticFluencyLogCopyWith<$Res> {
  factory $SemanticFluencyLogCopyWith(
          SemanticFluencyLog value, $Res Function(SemanticFluencyLog) then) =
      _$SemanticFluencyLogCopyWithImpl<$Res, SemanticFluencyLog>;
  @useResult
  $Res call(
      {String id,
      DateTime startedAt,
      String userId,
      List<AnswerWordWithTimestamp> answerWordWithTimestampList});
}

/// @nodoc
class _$SemanticFluencyLogCopyWithImpl<$Res, $Val extends SemanticFluencyLog>
    implements $SemanticFluencyLogCopyWith<$Res> {
  _$SemanticFluencyLogCopyWithImpl(this._value, this._then);

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
    Object? answerWordWithTimestampList = null,
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
      answerWordWithTimestampList: null == answerWordWithTimestampList
          ? _value.answerWordWithTimestampList
          : answerWordWithTimestampList // ignore: cast_nullable_to_non_nullable
              as List<AnswerWordWithTimestamp>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SemanticFluencyLogImplCopyWith<$Res>
    implements $SemanticFluencyLogCopyWith<$Res> {
  factory _$$SemanticFluencyLogImplCopyWith(_$SemanticFluencyLogImpl value,
          $Res Function(_$SemanticFluencyLogImpl) then) =
      __$$SemanticFluencyLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime startedAt,
      String userId,
      List<AnswerWordWithTimestamp> answerWordWithTimestampList});
}

/// @nodoc
class __$$SemanticFluencyLogImplCopyWithImpl<$Res>
    extends _$SemanticFluencyLogCopyWithImpl<$Res, _$SemanticFluencyLogImpl>
    implements _$$SemanticFluencyLogImplCopyWith<$Res> {
  __$$SemanticFluencyLogImplCopyWithImpl(_$SemanticFluencyLogImpl _value,
      $Res Function(_$SemanticFluencyLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startedAt = null,
    Object? userId = null,
    Object? answerWordWithTimestampList = null,
  }) {
    return _then(_$SemanticFluencyLogImpl(
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
      answerWordWithTimestampList: null == answerWordWithTimestampList
          ? _value._answerWordWithTimestampList
          : answerWordWithTimestampList // ignore: cast_nullable_to_non_nullable
              as List<AnswerWordWithTimestamp>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SemanticFluencyLogImpl extends _SemanticFluencyLog {
  _$SemanticFluencyLogImpl(
      {required this.id,
      required this.startedAt,
      required this.userId,
      final List<AnswerWordWithTimestamp> answerWordWithTimestampList =
          const []})
      : _answerWordWithTimestampList = answerWordWithTimestampList,
        super._();

  factory _$SemanticFluencyLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$SemanticFluencyLogImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime startedAt;
  @override
  final String userId;
  final List<AnswerWordWithTimestamp> _answerWordWithTimestampList;
  @override
  @JsonKey()
  List<AnswerWordWithTimestamp> get answerWordWithTimestampList {
    if (_answerWordWithTimestampList is EqualUnmodifiableListView)
      return _answerWordWithTimestampList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerWordWithTimestampList);
  }

  @override
  String toString() {
    return 'SemanticFluencyLog(id: $id, startedAt: $startedAt, userId: $userId, answerWordWithTimestampList: $answerWordWithTimestampList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SemanticFluencyLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
                other._answerWordWithTimestampList,
                _answerWordWithTimestampList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startedAt, userId,
      const DeepCollectionEquality().hash(_answerWordWithTimestampList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SemanticFluencyLogImplCopyWith<_$SemanticFluencyLogImpl> get copyWith =>
      __$$SemanticFluencyLogImplCopyWithImpl<_$SemanticFluencyLogImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SemanticFluencyLogImplToJson(
      this,
    );
  }
}

abstract class _SemanticFluencyLog extends SemanticFluencyLog {
  factory _SemanticFluencyLog(
          {required final String id,
          required final DateTime startedAt,
          required final String userId,
          final List<AnswerWordWithTimestamp> answerWordWithTimestampList}) =
      _$SemanticFluencyLogImpl;
  _SemanticFluencyLog._() : super._();

  factory _SemanticFluencyLog.fromJson(Map<String, dynamic> json) =
      _$SemanticFluencyLogImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get startedAt;
  @override
  String get userId;
  @override
  List<AnswerWordWithTimestamp> get answerWordWithTimestampList;
  @override
  @JsonKey(ignore: true)
  _$$SemanticFluencyLogImplCopyWith<_$SemanticFluencyLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
