// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_problem_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalculationProblemLog _$CalculationProblemLogFromJson(
    Map<String, dynamic> json) {
  return _CalculationProblemLog.fromJson(json);
}

/// @nodoc
mixin _$CalculationProblemLog {
  String get uid => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  List<CalculationProblem> get calculationProblems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalculationProblemLogCopyWith<CalculationProblemLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationProblemLogCopyWith<$Res> {
  factory $CalculationProblemLogCopyWith(CalculationProblemLog value,
          $Res Function(CalculationProblemLog) then) =
      _$CalculationProblemLogCopyWithImpl<$Res, CalculationProblemLog>;
  @useResult
  $Res call(
      {String uid,
      String? documentId,
      String id,
      List<CalculationProblem> calculationProblems});
}

/// @nodoc
class _$CalculationProblemLogCopyWithImpl<$Res,
        $Val extends CalculationProblemLog>
    implements $CalculationProblemLogCopyWith<$Res> {
  _$CalculationProblemLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? documentId = freezed,
    Object? id = null,
    Object? calculationProblems = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      calculationProblems: null == calculationProblems
          ? _value.calculationProblems
          : calculationProblems // ignore: cast_nullable_to_non_nullable
              as List<CalculationProblem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculationProblemLogImplCopyWith<$Res>
    implements $CalculationProblemLogCopyWith<$Res> {
  factory _$$CalculationProblemLogImplCopyWith(
          _$CalculationProblemLogImpl value,
          $Res Function(_$CalculationProblemLogImpl) then) =
      __$$CalculationProblemLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? documentId,
      String id,
      List<CalculationProblem> calculationProblems});
}

/// @nodoc
class __$$CalculationProblemLogImplCopyWithImpl<$Res>
    extends _$CalculationProblemLogCopyWithImpl<$Res,
        _$CalculationProblemLogImpl>
    implements _$$CalculationProblemLogImplCopyWith<$Res> {
  __$$CalculationProblemLogImplCopyWithImpl(_$CalculationProblemLogImpl _value,
      $Res Function(_$CalculationProblemLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? documentId = freezed,
    Object? id = null,
    Object? calculationProblems = null,
  }) {
    return _then(_$CalculationProblemLogImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      calculationProblems: null == calculationProblems
          ? _value._calculationProblems
          : calculationProblems // ignore: cast_nullable_to_non_nullable
              as List<CalculationProblem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculationProblemLogImpl extends _CalculationProblemLog {
  _$CalculationProblemLogImpl(
      {required this.uid,
      required this.documentId,
      this.id = '',
      required final List<CalculationProblem> calculationProblems})
      : _calculationProblems = calculationProblems,
        super._();

  factory _$CalculationProblemLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculationProblemLogImplFromJson(json);

  @override
  final String uid;
  @override
  final String? documentId;
  @override
  @JsonKey()
  final String id;
  final List<CalculationProblem> _calculationProblems;
  @override
  List<CalculationProblem> get calculationProblems {
    if (_calculationProblems is EqualUnmodifiableListView)
      return _calculationProblems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calculationProblems);
  }

  @override
  String toString() {
    return 'CalculationProblemLog(uid: $uid, documentId: $documentId, id: $id, calculationProblems: $calculationProblems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationProblemLogImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._calculationProblems, _calculationProblems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, documentId, id,
      const DeepCollectionEquality().hash(_calculationProblems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationProblemLogImplCopyWith<_$CalculationProblemLogImpl>
      get copyWith => __$$CalculationProblemLogImplCopyWithImpl<
          _$CalculationProblemLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculationProblemLogImplToJson(
      this,
    );
  }
}

abstract class _CalculationProblemLog extends CalculationProblemLog {
  factory _CalculationProblemLog(
          {required final String uid,
          required final String? documentId,
          final String id,
          required final List<CalculationProblem> calculationProblems}) =
      _$CalculationProblemLogImpl;
  _CalculationProblemLog._() : super._();

  factory _CalculationProblemLog.fromJson(Map<String, dynamic> json) =
      _$CalculationProblemLogImpl.fromJson;

  @override
  String get uid;
  @override
  String? get documentId;
  @override
  String get id;
  @override
  List<CalculationProblem> get calculationProblems;
  @override
  @JsonKey(ignore: true)
  _$$CalculationProblemLogImplCopyWith<_$CalculationProblemLogImpl>
      get copyWith => throw _privateConstructorUsedError;
}
