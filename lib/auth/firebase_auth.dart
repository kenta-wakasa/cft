import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider((_) => FirebaseAuth.instance);

final authStateProvider = StreamProvider.autoDispose<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

final currentUserProvider = Provider.autoDispose((ref) {
  ref.watch(authStateProvider);
  return ref.read(firebaseAuthProvider).currentUser;
});

final uidProvider = Provider.autoDispose((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.uid;
});

final isAdminProvider = Provider.autoDispose((ref) {
  final uid = ref.watch(uidProvider);
  return uid == 'TJ5Z7N4PZ3faZcuQtVV5tHLc4HM2';
});
