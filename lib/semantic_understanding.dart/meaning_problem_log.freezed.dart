// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meaning_problem_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MeaningProblemLog _$MeaningProblemLogFromJson(Map<String, dynamic> json) {
  return _MeaningProblemLog.fromJson(json);
}

/// @nodoc
mixin _$MeaningProblemLog {
  String get uid => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  List<MeaningProblem> get meaningProblems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeaningProblemLogCopyWith<MeaningProblemLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeaningProblemLogCopyWith<$Res> {
  factory $MeaningProblemLogCopyWith(
          MeaningProblemLog value, $Res Function(MeaningProblemLog) then) =
      _$MeaningProblemLogCopyWithImpl<$Res, MeaningProblemLog>;
  @useResult
  $Res call({String uid, String id, List<MeaningProblem> meaningProblems});
}

/// @nodoc
class _$MeaningProblemLogCopyWithImpl<$Res, $Val extends MeaningProblemLog>
    implements $MeaningProblemLogCopyWith<$Res> {
  _$MeaningProblemLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? id = null,
    Object? meaningProblems = null,
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
      meaningProblems: null == meaningProblems
          ? _value.meaningProblems
          : meaningProblems // ignore: cast_nullable_to_non_nullable
              as List<MeaningProblem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeaningProblemLogImplCopyWith<$Res>
    implements $MeaningProblemLogCopyWith<$Res> {
  factory _$$MeaningProblemLogImplCopyWith(_$MeaningProblemLogImpl value,
          $Res Function(_$MeaningProblemLogImpl) then) =
      __$$MeaningProblemLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String id, List<MeaningProblem> meaningProblems});
}

/// @nodoc
class __$$MeaningProblemLogImplCopyWithImpl<$Res>
    extends _$MeaningProblemLogCopyWithImpl<$Res, _$MeaningProblemLogImpl>
    implements _$$MeaningProblemLogImplCopyWith<$Res> {
  __$$MeaningProblemLogImplCopyWithImpl(_$MeaningProblemLogImpl _value,
      $Res Function(_$MeaningProblemLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? id = null,
    Object? meaningProblems = null,
  }) {
    return _then(_$MeaningProblemLogImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      meaningProblems: null == meaningProblems
          ? _value._meaningProblems
          : meaningProblems // ignore: cast_nullable_to_non_nullable
              as List<MeaningProblem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeaningProblemLogImpl extends _MeaningProblemLog {
  _$MeaningProblemLogImpl(
      {required this.uid,
      this.id = '',
      required final List<MeaningProblem> meaningProblems})
      : _meaningProblems = meaningProblems,
        super._();

  factory _$MeaningProblemLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeaningProblemLogImplFromJson(json);

  @override
  final String uid;
  @override
  @JsonKey()
  final String id;
  final List<MeaningProblem> _meaningProblems;
  @override
  List<MeaningProblem> get meaningProblems {
    if (_meaningProblems is EqualUnmodifiableListView) return _meaningProblems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meaningProblems);
  }

  @override
  String toString() {
    return 'MeaningProblemLog(uid: $uid, id: $id, meaningProblems: $meaningProblems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeaningProblemLogImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._meaningProblems, _meaningProblems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, id,
      const DeepCollectionEquality().hash(_meaningProblems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeaningProblemLogImplCopyWith<_$MeaningProblemLogImpl> get copyWith =>
      __$$MeaningProblemLogImplCopyWithImpl<_$MeaningProblemLogImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeaningProblemLogImplToJson(
      this,
    );
  }
}

abstract class _MeaningProblemLog extends MeaningProblemLog {
  factory _MeaningProblemLog(
          {required final String uid,
          final String id,
          required final List<MeaningProblem> meaningProblems}) =
      _$MeaningProblemLogImpl;
  _MeaningProblemLog._() : super._();

  factory _MeaningProblemLog.fromJson(Map<String, dynamic> json) =
      _$MeaningProblemLogImpl.fromJson;

  @override
  String get uid;
  @override
  String get id;
  @override
  List<MeaningProblem> get meaningProblems;
  @override
  @JsonKey(ignore: true)
  _$$MeaningProblemLogImplCopyWith<_$MeaningProblemLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
