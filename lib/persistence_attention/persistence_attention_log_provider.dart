import 'package:cft/firestore/firestore.dart';
import 'package:cft/persistence_attention/persistence_attention_log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'persistence_attention_log_provider.g.dart';

@riverpod
CollectionReference<PersistenceAttentionLog> persistenceAttentionLogReference(
    PersistenceAttentionLogReferenceRef ref) {
  final firestore = ref.watch(firestoreProvider);
  return firestore.collection('persistence_attention_log').withConverter(
        fromFirestore: (doc, _) =>
            PersistenceAttentionLog.fromJson(doc.data()!),
        toFirestore: (obj, _) => obj.toJson(),
      );
}
