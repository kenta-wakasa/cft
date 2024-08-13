import 'package:cft/persistence_attention/persistence_attention_log.dart';
import 'package:cft/persistence_attention/persistence_attention_log_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'persistence_attention_logs_stream.g.dart';

@riverpod
Stream<List<PersistenceAttentionLog>> streamPersistenceAttentionLogs(
    StreamPersistenceAttentionLogsRef ref) {
  final persistenceAttentionLogReference =
      ref.read(persistenceAttentionLogReferenceProvider);
  return persistenceAttentionLogReference
      .orderBy('startedAt')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) => doc.data()).toList();
  });
}
