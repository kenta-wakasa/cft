// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Graph _$GraphFromJson(Map<String, dynamic> json) {
  return _Graph.fromJson(json);
}

/// @nodoc
mixin _$Graph {
  List<Node> get nodes => throw _privateConstructorUsedError;
  List<Edge> get edges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraphCopyWith<Graph> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphCopyWith<$Res> {
  factory $GraphCopyWith(Graph value, $Res Function(Graph) then) =
      _$GraphCopyWithImpl<$Res, Graph>;
  @useResult
  $Res call({List<Node> nodes, List<Edge> edges});
}

/// @nodoc
class _$GraphCopyWithImpl<$Res, $Val extends Graph>
    implements $GraphCopyWith<$Res> {
  _$GraphCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodes = null,
    Object? edges = null,
  }) {
    return _then(_value.copyWith(
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<Node>,
      edges: null == edges
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<Edge>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GraphImplCopyWith<$Res> implements $GraphCopyWith<$Res> {
  factory _$$GraphImplCopyWith(
          _$GraphImpl value, $Res Function(_$GraphImpl) then) =
      __$$GraphImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Node> nodes, List<Edge> edges});
}

/// @nodoc
class __$$GraphImplCopyWithImpl<$Res>
    extends _$GraphCopyWithImpl<$Res, _$GraphImpl>
    implements _$$GraphImplCopyWith<$Res> {
  __$$GraphImplCopyWithImpl(
      _$GraphImpl _value, $Res Function(_$GraphImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodes = null,
    Object? edges = null,
  }) {
    return _then(_$GraphImpl(
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<Node>,
      edges: null == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<Edge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GraphImpl extends _Graph {
  _$GraphImpl(
      {required final List<Node> nodes, required final List<Edge> edges})
      : _nodes = nodes,
        _edges = edges,
        super._();

  factory _$GraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$GraphImplFromJson(json);

  final List<Node> _nodes;
  @override
  List<Node> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  final List<Edge> _edges;
  @override
  List<Edge> get edges {
    if (_edges is EqualUnmodifiableListView) return _edges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_edges);
  }

  @override
  String toString() {
    return 'Graph(nodes: $nodes, edges: $edges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphImpl &&
            const DeepCollectionEquality().equals(other._nodes, _nodes) &&
            const DeepCollectionEquality().equals(other._edges, _edges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_nodes),
      const DeepCollectionEquality().hash(_edges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphImplCopyWith<_$GraphImpl> get copyWith =>
      __$$GraphImplCopyWithImpl<_$GraphImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GraphImplToJson(
      this,
    );
  }
}

abstract class _Graph extends Graph {
  factory _Graph(
      {required final List<Node> nodes,
      required final List<Edge> edges}) = _$GraphImpl;
  _Graph._() : super._();

  factory _Graph.fromJson(Map<String, dynamic> json) = _$GraphImpl.fromJson;

  @override
  List<Node> get nodes;
  @override
  List<Edge> get edges;
  @override
  @JsonKey(ignore: true)
  _$$GraphImplCopyWith<_$GraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
