import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_memory_log.freezed.dart';
part 'recent_memory_log.g.dart';

@freezed
class RecentMemoryLog with _$RecentMemoryLog {
  factory RecentMemoryLog({
    required String uid,
    @Default('') String id,
    required DateTime createdAt,
    DateTime? finishedAt,
    @Default([]) List<String> memoryList,
    @Default([]) List<String> answerList,
  }) = _RecentMemoryLog;
  const RecentMemoryLog._();

  factory RecentMemoryLog.fromJson(Map<String, dynamic> json) =>
      _$RecentMemoryLogFromJson(json);
}
