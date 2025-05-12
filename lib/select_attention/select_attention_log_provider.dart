import 'package:cft/firestore/firestore.dart';
import 'package:cft/select_attention/select_attention_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectAttentionLogReferenceProvider = Provider.autoDispose((ref) {
  final firestore = ref.watch(firestoreProvider);

  return firestore.collection('select_attention_log').withConverter(
        fromFirestore: (doc, _) {
          final data = doc.data()!;
          data['documentId'] = doc.id;
          return SelectAttentionLog.fromJson(data);
        },
        toFirestore: (obj, _) => obj.toJson(),
      );
});

final selectAttentionLogsProvider =
    StreamProvider.autoDispose<List<SelectAttentionLog>>((ref) {
  final reference = ref.watch(selectAttentionLogReferenceProvider);

  return reference.snapshots().map((snapshot) {
    return snapshot.docs.map((doc) => doc.data()).toList();
  });
});
