// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_memory_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecentMemoryLog _$RecentMemoryLogFromJson(Map<String, dynamic> json) {
  return _RecentMemoryLog.fromJson(json);
}

/// @nodoc
mixin _$RecentMemoryLog {
  String get uid => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get ansStartedAt => throw _privateConstructorUsedError;
  DateTime? get finishedAt => throw _privateConstructorUsedError;
  List<String> get memoryList => throw _privateConstructorUsedError;
  List<String> get answerList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentMemoryLogCopyWith<RecentMemoryLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentMemoryLogCopyWith<$Res> {
  factory $RecentMemoryLogCopyWith(
          RecentMemoryLog value, $Res Function(RecentMemoryLog) then) =
      _$RecentMemoryLogCopyWithImpl<$Res, RecentMemoryLog>;
  @useResult
  $Res call(
      {String uid,
      String id,
      String? documentId,
      DateTime createdAt,
      DateTime? ansStartedAt,
      DateTime? finishedAt,
      List<String> memoryList,
      List<String> answerList});
}

/// @nodoc
class _$RecentMemoryLogCopyWithImpl<$Res, $Val extends RecentMemoryLog>
    implements $RecentMemoryLogCopyWith<$Res> {
  _$RecentMemoryLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? id = null,
    Object? documentId = freezed,
    Object? createdAt = null,
    Object? ansStartedAt = freezed,
    Object? finishedAt = freezed,
    Object? memoryList = null,
    Object? answerList = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ansStartedAt: freezed == ansStartedAt
          ? _value.ansStartedAt
          : ansStartedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      memoryList: null == memoryList
          ? _value.memoryList
          : memoryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answerList: null == answerList
          ? _value.answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentMemoryLogImplCopyWith<$Res>
    implements $RecentMemoryLogCopyWith<$Res> {
  factory _$$RecentMemoryLogImplCopyWith(_$RecentMemoryLogImpl value,
          $Res Function(_$RecentMemoryLogImpl) then) =
      __$$RecentMemoryLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String id,
      String? documentId,
      DateTime createdAt,
      DateTime? ansStartedAt,
      DateTime? finishedAt,
      List<String> memoryList,
      List<String> answerList});
}

/// @nodoc
class __$$RecentMemoryLogImplCopyWithImpl<$Res>
    extends _$RecentMemoryLogCopyWithImpl<$Res, _$RecentMemoryLogImpl>
    implements _$$RecentMemoryLogImplCopyWith<$Res> {
  __$$RecentMemoryLogImplCopyWithImpl(
      _$RecentMemoryLogImpl _value, $Res Function(_$RecentMemoryLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? id = null,
    Object? documentId = freezed,
    Object? createdAt = null,
    Object? ansStartedAt = freezed,
    Object? finishedAt = freezed,
    Object? memoryList = null,
    Object? answerList = null,
  }) {
    return _then(_$RecentMemoryLogImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ansStartedAt: freezed == ansStartedAt
          ? _value.ansStartedAt
          : ansStartedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      memoryList: null == memoryList
          ? _value._memoryList
          : memoryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answerList: null == answerList
          ? _value._answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentMemoryLogImpl extends _RecentMemoryLog {
  _$RecentMemoryLogImpl(
      {required this.uid,
      this.id = '',
      required this.documentId,
      required this.createdAt,
      required this.ansStartedAt,
      this.finishedAt,
      final List<String> memoryList = const [],
      final List<String> answerList = const []})
      : _memoryList = memoryList,
        _answerList = answerList,
        super._();

  factory _$RecentMemoryLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentMemoryLogImplFromJson(json);

  @override
  final String uid;
  @override
  @JsonKey()
  final String id;
  @override
  final String? documentId;
  @override
  final DateTime createdAt;
  @override
  final DateTime? ansStartedAt;
  @override
  final DateTime? finishedAt;
  final List<String> _memoryList;
  @override
  @JsonKey()
  List<String> get memoryList {
    if (_memoryList is EqualUnmodifiableListView) return _memoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memoryList);
  }

  final List<String> _answerList;
  @override
  @JsonKey()
  List<String> get answerList {
    if (_answerList is EqualUnmodifiableListView) return _answerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerList);
  }

  @override
  String toString() {
    return 'RecentMemoryLog(uid: $uid, id: $id, documentId: $documentId, createdAt: $createdAt, ansStartedAt: $ansStartedAt, finishedAt: $finishedAt, memoryList: $memoryList, answerList: $answerList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentMemoryLogImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.ansStartedAt, ansStartedAt) ||
                other.ansStartedAt == ansStartedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            const DeepCollectionEquality()
                .equals(other._memoryList, _memoryList) &&
            const DeepCollectionEquality()
                .equals(other._answerList, _answerList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      id,
      documentId,
      createdAt,
      ansStartedAt,
      finishedAt,
      const DeepCollectionEquality().hash(_memoryList),
      const DeepCollectionEquality().hash(_answerList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentMemoryLogImplCopyWith<_$RecentMemoryLogImpl> get copyWith =>
      __$$RecentMemoryLogImplCopyWithImpl<_$RecentMemoryLogImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentMemoryLogImplToJson(
      this,
    );
  }
}

abstract class _RecentMemoryLog extends RecentMemoryLog {
  factory _RecentMemoryLog(
      {required final String uid,
      final String id,
      required final String? documentId,
      required final DateTime createdAt,
      required final DateTime? ansStartedAt,
      final DateTime? finishedAt,
      final List<String> memoryList,
      final List<String> answerList}) = _$RecentMemoryLogImpl;
  _RecentMemoryLog._() : super._();

  factory _RecentMemoryLog.fromJson(Map<String, dynamic> json) =
      _$RecentMemoryLogImpl.fromJson;

  @override
  String get uid;
  @override
  String get id;
  @override
  String? get documentId;
  @override
  DateTime get createdAt;
  @override
  DateTime? get ansStartedAt;
  @override
  DateTime? get finishedAt;
  @override
  List<String> get memoryList;
  @override
  List<String> get answerList;
  @override
  @JsonKey(ignore: true)
  _$$RecentMemoryLogImplCopyWith<_$RecentMemoryLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
