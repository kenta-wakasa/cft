import 'package:cft/firestore/firestore.dart';
import 'package:cft/immediate_memory/immediate_memory_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final immediateMemoryLogReference = Provider.autoDispose((ref) {
  final firestore = ref.watch(firestoreProvider);

  return firestore.collection('immediate_memory_log').withConverter(
        fromFirestore: (doc, _) {
          final data = doc.data()!;
          data['documentId'] = doc.id;
          return ImmediateMemoryLog.fromJson(data);
        },
        toFirestore: (obj, _) => obj.toJson(),
      );
});

final immediateMemoryLogsProvider =
    StreamProvider.autoDispose<List<ImmediateMemoryLog>>((ref) {
  final reference = ref
      .watch(immediateMemoryLogReference)
      .orderBy('immediateMemoryProblem.startedAt', descending: true);

  return reference.snapshots().map((snapshot) {
    return snapshot.docs.map((doc) => doc.data()).toList();
  });
});
