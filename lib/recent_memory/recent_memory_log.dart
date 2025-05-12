import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_memory_log.freezed.dart';
part 'recent_memory_log.g.dart';

@freezed
class RecentMemoryLog with _$RecentMemoryLog {
  factory RecentMemoryLog({
    required String uid,
    @Default('') String id,
    required String? documentId,
    required DateTime createdAt,
    DateTime? finishedAt,
    @Default([]) List<String> memoryList,
    @Default([]) List<String> answerList,
  }) = _RecentMemoryLog;
  const RecentMemoryLog._();

  factory RecentMemoryLog.fromJson(Map<String, dynamic> json) =>
      _$RecentMemoryLogFromJson(json);

  int get correctCount {
    return memoryList.fold<int>(
        0,
        (previousValue, element) =>
            previousValue + (answerList.contains(element) ? 1 : 0));
  }

  /// 誤答数
  int get incorrectCount {
    return memoryList.fold<int>(
        0,
        (previousValue, element) =>
            previousValue + (answerList.contains(element) ? 0 : 1));
  }

  /// 正解率
  double get correctRate {
    return correctCount / memoryList.length;
  }

  /// 経過時間ms
  int get elapsedTime {
    if (finishedAt == null) {
      return 0;
    }
    return finishedAt!.difference(createdAt).inMilliseconds;
  }
}
