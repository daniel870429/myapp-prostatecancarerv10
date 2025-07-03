// lib/presentation/features/auth/notifiers/auth_notifier.dart

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/data_providers.dart';
import '../../../../domain/repositories/auth_repository.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _authRepository;

  @override
  Stream<User?> build() {
    _authRepository = ref.watch(authRepositoryProvider);
    return _authRepository.authStateChanges;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
