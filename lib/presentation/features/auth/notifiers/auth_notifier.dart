// lib/presentation/features/auth/notifiers/auth_notifier.dart

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/data_providers.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Stream<User?> build() {
    // Listen to the auth state changes from the repository
    return ref.watch(authRepositoryProvider).authStateChanges;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    try {
      await authRepository.signInWithEmailAndPassword(email: email, password: password);
      // The stream will automatically emit the new user, so we don't need to set state here.
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    try {
      await authRepository.createUserWithEmailAndPassword(email: email, password: password);
      // The stream will automatically emit the new user, so we don't need to set state here.
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    await authRepository.signOut();
  }
}
