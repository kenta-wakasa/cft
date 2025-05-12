// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_attention_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectAttentionLog _$SelectAttentionLogFromJson(Map<String, dynamic> json) {
  return _SelectAttentionLog.fromJson(json);
}

/// @nodoc
mixin _$SelectAttentionLog {
  String get id => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<SelectAttentionProblem> get selectAttentionProblems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectAttentionLogCopyWith<SelectAttentionLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectAttentionLogCopyWith<$Res> {
  factory $SelectAttentionLogCopyWith(
          SelectAttentionLog value, $Res Function(SelectAttentionLog) then) =
      _$SelectAttentionLogCopyWithImpl<$Res, SelectAttentionLog>;
  @useResult
  $Res call(
      {String id,
      String? documentId,
      String userId,
      List<SelectAttentionProblem> selectAttentionProblems});
}

/// @nodoc
class _$SelectAttentionLogCopyWithImpl<$Res, $Val extends SelectAttentionLog>
    implements $SelectAttentionLogCopyWith<$Res> {
  _$SelectAttentionLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentId = freezed,
    Object? userId = null,
    Object? selectAttentionProblems = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      selectAttentionProblems: null == selectAttentionProblems
          ? _value.selectAttentionProblems
          : selectAttentionProblems // ignore: cast_nullable_to_non_nullable
              as List<SelectAttentionProblem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectAttentionLogImplCopyWith<$Res>
    implements $SelectAttentionLogCopyWith<$Res> {
  factory _$$SelectAttentionLogImplCopyWith(_$SelectAttentionLogImpl value,
          $Res Function(_$SelectAttentionLogImpl) then) =
      __$$SelectAttentionLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? documentId,
      String userId,
      List<SelectAttentionProblem> selectAttentionProblems});
}

/// @nodoc
class __$$SelectAttentionLogImplCopyWithImpl<$Res>
    extends _$SelectAttentionLogCopyWithImpl<$Res, _$SelectAttentionLogImpl>
    implements _$$SelectAttentionLogImplCopyWith<$Res> {
  __$$SelectAttentionLogImplCopyWithImpl(_$SelectAttentionLogImpl _value,
      $Res Function(_$SelectAttentionLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentId = freezed,
    Object? userId = null,
    Object? selectAttentionProblems = null,
  }) {
    return _then(_$SelectAttentionLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      selectAttentionProblems: null == selectAttentionProblems
          ? _value._selectAttentionProblems
          : selectAttentionProblems // ignore: cast_nullable_to_non_nullable
              as List<SelectAttentionProblem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectAttentionLogImpl extends _SelectAttentionLog {
  _$SelectAttentionLogImpl(
      {required this.id,
      required this.documentId,
      required this.userId,
      required final List<SelectAttentionProblem> selectAttentionProblems})
      : _selectAttentionProblems = selectAttentionProblems,
        super._();

  factory _$SelectAttentionLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectAttentionLogImplFromJson(json);

  @override
  final String id;
  @override
  final String? documentId;
  @override
  final String userId;
  final List<SelectAttentionProblem> _selectAttentionProblems;
  @override
  List<SelectAttentionProblem> get selectAttentionProblems {
    if (_selectAttentionProblems is EqualUnmodifiableListView)
      return _selectAttentionProblems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectAttentionProblems);
  }

  @override
  String toString() {
    return 'SelectAttentionLog(id: $id, documentId: $documentId, userId: $userId, selectAttentionProblems: $selectAttentionProblems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAttentionLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
                other._selectAttentionProblems, _selectAttentionProblems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, documentId, userId,
      const DeepCollectionEquality().hash(_selectAttentionProblems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAttentionLogImplCopyWith<_$SelectAttentionLogImpl> get copyWith =>
      __$$SelectAttentionLogImplCopyWithImpl<_$SelectAttentionLogImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectAttentionLogImplToJson(
      this,
    );
  }
}

abstract class _SelectAttentionLog extends SelectAttentionLog {
  factory _SelectAttentionLog(
      {required final String id,
      required final String? documentId,
      required final String userId,
      required final List<SelectAttentionProblem>
          selectAttentionProblems}) = _$SelectAttentionLogImpl;
  _SelectAttentionLog._() : super._();

  factory _SelectAttentionLog.fromJson(Map<String, dynamic> json) =
      _$SelectAttentionLogImpl.fromJson;

  @override
  String get id;
  @override
  String? get documentId;
  @override
  String get userId;
  @override
  List<SelectAttentionProblem> get selectAttentionProblems;
  @override
  @JsonKey(ignore: true)
  _$$SelectAttentionLogImplCopyWith<_$SelectAttentionLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
