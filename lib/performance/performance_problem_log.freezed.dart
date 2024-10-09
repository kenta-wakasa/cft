// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance_problem_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PerformanceProblemLog _$PerformanceProblemLogFromJson(
    Map<String, dynamic> json) {
  return _PerformanceProblemLog.fromJson(json);
}

/// @nodoc
mixin _$PerformanceProblemLog {
  String get uid => throw _privateConstructorUsedError;
  List<PerformanceProblem> get performanceProblems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerformanceProblemLogCopyWith<PerformanceProblemLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceProblemLogCopyWith<$Res> {
  factory $PerformanceProblemLogCopyWith(PerformanceProblemLog value,
          $Res Function(PerformanceProblemLog) then) =
      _$PerformanceProblemLogCopyWithImpl<$Res, PerformanceProblemLog>;
  @useResult
  $Res call({String uid, List<PerformanceProblem> performanceProblems});
}

/// @nodoc
class _$PerformanceProblemLogCopyWithImpl<$Res,
        $Val extends PerformanceProblemLog>
    implements $PerformanceProblemLogCopyWith<$Res> {
  _$PerformanceProblemLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? performanceProblems = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      performanceProblems: null == performanceProblems
          ? _value.performanceProblems
          : performanceProblems // ignore: cast_nullable_to_non_nullable
              as List<PerformanceProblem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceProblemLogImplCopyWith<$Res>
    implements $PerformanceProblemLogCopyWith<$Res> {
  factory _$$PerformanceProblemLogImplCopyWith(
          _$PerformanceProblemLogImpl value,
          $Res Function(_$PerformanceProblemLogImpl) then) =
      __$$PerformanceProblemLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, List<PerformanceProblem> performanceProblems});
}

/// @nodoc
class __$$PerformanceProblemLogImplCopyWithImpl<$Res>
    extends _$PerformanceProblemLogCopyWithImpl<$Res,
        _$PerformanceProblemLogImpl>
    implements _$$PerformanceProblemLogImplCopyWith<$Res> {
  __$$PerformanceProblemLogImplCopyWithImpl(_$PerformanceProblemLogImpl _value,
      $Res Function(_$PerformanceProblemLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? performanceProblems = null,
  }) {
    return _then(_$PerformanceProblemLogImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      performanceProblems: null == performanceProblems
          ? _value._performanceProblems
          : performanceProblems // ignore: cast_nullable_to_non_nullable
              as List<PerformanceProblem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceProblemLogImpl extends _PerformanceProblemLog {
  _$PerformanceProblemLogImpl(
      {required this.uid,
      required final List<PerformanceProblem> performanceProblems})
      : _performanceProblems = performanceProblems,
        super._();

  factory _$PerformanceProblemLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceProblemLogImplFromJson(json);

  @override
  final String uid;
  final List<PerformanceProblem> _performanceProblems;
  @override
  List<PerformanceProblem> get performanceProblems {
    if (_performanceProblems is EqualUnmodifiableListView)
      return _performanceProblems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_performanceProblems);
  }

  @override
  String toString() {
    return 'PerformanceProblemLog(uid: $uid, performanceProblems: $performanceProblems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceProblemLogImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality()
                .equals(other._performanceProblems, _performanceProblems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid,
      const DeepCollectionEquality().hash(_performanceProblems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceProblemLogImplCopyWith<_$PerformanceProblemLogImpl>
      get copyWith => __$$PerformanceProblemLogImplCopyWithImpl<
          _$PerformanceProblemLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceProblemLogImplToJson(
      this,
    );
  }
}

abstract class _PerformanceProblemLog extends PerformanceProblemLog {
  factory _PerformanceProblemLog(
          {required final String uid,
          required final List<PerformanceProblem> performanceProblems}) =
      _$PerformanceProblemLogImpl;
  _PerformanceProblemLog._() : super._();

  factory _PerformanceProblemLog.fromJson(Map<String, dynamic> json) =
      _$PerformanceProblemLogImpl.fromJson;

  @override
  String get uid;
  @override
  List<PerformanceProblem> get performanceProblems;
  @override
  @JsonKey(ignore: true)
  _$$PerformanceProblemLogImplCopyWith<_$PerformanceProblemLogImpl>
      get copyWith => throw _privateConstructorUsedError;
}
