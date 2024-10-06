// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance_problem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PerformanceProblem _$PerformanceProblemFromJson(Map<String, dynamic> json) {
  return _PerformanceProblem.fromJson(json);
}

/// @nodoc
mixin _$PerformanceProblem {
  Graph get graph => throw _privateConstructorUsedError;
  List<String> get questionTexts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerformanceProblemCopyWith<PerformanceProblem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceProblemCopyWith<$Res> {
  factory $PerformanceProblemCopyWith(
          PerformanceProblem value, $Res Function(PerformanceProblem) then) =
      _$PerformanceProblemCopyWithImpl<$Res, PerformanceProblem>;
  @useResult
  $Res call({Graph graph, List<String> questionTexts});

  $GraphCopyWith<$Res> get graph;
}

/// @nodoc
class _$PerformanceProblemCopyWithImpl<$Res, $Val extends PerformanceProblem>
    implements $PerformanceProblemCopyWith<$Res> {
  _$PerformanceProblemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? graph = null,
    Object? questionTexts = null,
  }) {
    return _then(_value.copyWith(
      graph: null == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as Graph,
      questionTexts: null == questionTexts
          ? _value.questionTexts
          : questionTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GraphCopyWith<$Res> get graph {
    return $GraphCopyWith<$Res>(_value.graph, (value) {
      return _then(_value.copyWith(graph: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PerformanceProblemImplCopyWith<$Res>
    implements $PerformanceProblemCopyWith<$Res> {
  factory _$$PerformanceProblemImplCopyWith(_$PerformanceProblemImpl value,
          $Res Function(_$PerformanceProblemImpl) then) =
      __$$PerformanceProblemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Graph graph, List<String> questionTexts});

  @override
  $GraphCopyWith<$Res> get graph;
}

/// @nodoc
class __$$PerformanceProblemImplCopyWithImpl<$Res>
    extends _$PerformanceProblemCopyWithImpl<$Res, _$PerformanceProblemImpl>
    implements _$$PerformanceProblemImplCopyWith<$Res> {
  __$$PerformanceProblemImplCopyWithImpl(_$PerformanceProblemImpl _value,
      $Res Function(_$PerformanceProblemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? graph = null,
    Object? questionTexts = null,
  }) {
    return _then(_$PerformanceProblemImpl(
      graph: null == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as Graph,
      questionTexts: null == questionTexts
          ? _value._questionTexts
          : questionTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceProblemImpl extends _PerformanceProblem {
  _$PerformanceProblemImpl(
      {required this.graph, required final List<String> questionTexts})
      : _questionTexts = questionTexts,
        super._();

  factory _$PerformanceProblemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceProblemImplFromJson(json);

  @override
  final Graph graph;
  final List<String> _questionTexts;
  @override
  List<String> get questionTexts {
    if (_questionTexts is EqualUnmodifiableListView) return _questionTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionTexts);
  }

  @override
  String toString() {
    return 'PerformanceProblem(graph: $graph, questionTexts: $questionTexts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceProblemImpl &&
            (identical(other.graph, graph) || other.graph == graph) &&
            const DeepCollectionEquality()
                .equals(other._questionTexts, _questionTexts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, graph, const DeepCollectionEquality().hash(_questionTexts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceProblemImplCopyWith<_$PerformanceProblemImpl> get copyWith =>
      __$$PerformanceProblemImplCopyWithImpl<_$PerformanceProblemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceProblemImplToJson(
      this,
    );
  }
}

abstract class _PerformanceProblem extends PerformanceProblem {
  factory _PerformanceProblem(
      {required final Graph graph,
      required final List<String> questionTexts}) = _$PerformanceProblemImpl;
  _PerformanceProblem._() : super._();

  factory _PerformanceProblem.fromJson(Map<String, dynamic> json) =
      _$PerformanceProblemImpl.fromJson;

  @override
  Graph get graph;
  @override
  List<String> get questionTexts;
  @override
  @JsonKey(ignore: true)
  _$$PerformanceProblemImplCopyWith<_$PerformanceProblemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
