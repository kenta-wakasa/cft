import 'package:cft/select_attention/select_attention_problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'select_attention_log.freezed.dart';
part 'select_attention_log.g.dart';

@freezed
class SelectAttentionLog with _$SelectAttentionLog {
  factory SelectAttentionLog({
    required String id,
    required String userId,
    required List<SelectAttentionProblem> selectAttentionProblems,
  }) = _SelectAttentionLog;
  const SelectAttentionLog._();

  factory SelectAttentionLog.fromJson(Map<String, dynamic> json) =>
      _$SelectAttentionLogFromJson(json);
}
