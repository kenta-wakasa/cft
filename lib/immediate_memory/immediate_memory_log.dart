import 'package:cft/immediate_memory/immediate_memory_problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'immediate_memory_log.freezed.dart';
part 'immediate_memory_log.g.dart';

@freezed
class ImmediateMemoryLog with _$ImmediateMemoryLog {
  factory ImmediateMemoryLog({
    required String id,
    required String userId,
    required String? documentId,
    required ImmediateMemoryProblem immediateMemoryProblem,
  }) = _ImmediateMemoryLog;
  const ImmediateMemoryLog._();

  factory ImmediateMemoryLog.fromJson(Map<String, dynamic> json) =>
      _$ImmediateMemoryLogFromJson(json);
}
