import 'package:cft/persistence_attention/simple_arithmetic_problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'persistence_attention_state.freezed.dart';
part 'persistence_attention_state.g.dart';

@freezed
class PersistenceAttentionState with _$PersistenceAttentionState {
  factory PersistenceAttentionState({
    required bool isPlaying,
    required List<SimpleArithmeticProblem> problems,
  }) = _PersistenceAttentionState;
  const PersistenceAttentionState._();

  factory PersistenceAttentionState.fromJson(Map<String, dynamic> json) =>
      _$PersistenceAttentionStateFromJson(json);
}
