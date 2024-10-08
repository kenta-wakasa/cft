import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_memory_log.freezed.dart';
part 'recent_memory_log.g.dart';

@freezed
class RecentMemoryLog with _$RecentMemoryLog {
  factory RecentMemoryLog({
    required String uid,
    required DateTime createdAt,
    required List<String> memoryList,
    @Default([]) List<String> answerList,
    DateTime? finishedAt,
  }) = _RecentMemoryLog;
  const RecentMemoryLog._();

  factory RecentMemoryLog.fromJson(Map<String, dynamic> json) =>
      _$RecentMemoryLogFromJson(json);
}
