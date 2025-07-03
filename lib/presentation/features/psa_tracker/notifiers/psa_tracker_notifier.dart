import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/data_providers.dart';
import '../../../../domain/entities/psa_log.dart';
import '../../auth/notifiers/auth_notifier.dart';

part 'psa_tracker_notifier.g.dart';

@riverpod
class PsaTrackerNotifier extends _$PsaTrackerNotifier {
  @override
  Stream<List<PsaLog>> build() {
    final user = ref.watch(authNotifierProvider).value;
    if (user == null) {
      return Stream.value([]);
    }
    final repository = ref.watch(psaRepositoryProvider);
    return repository.watchAllPsaLogs(user.uid);
  }

  Future<void> addPsaLog(double value, String? notes) async {
    final user = ref.read(authNotifierProvider).value;
    if (user == null) {
      _handleError('User not authenticated', null, StackTrace.current);
      return;
    }

    final newLog = PsaLog(
      id: 0,
      value: value,
      recordedAt: DateTime.now(),
      notes: notes,
      userId: user.uid,
    );

    final repository = ref.read(psaRepositoryProvider);
    try {
      await repository.addPsaLog(newLog);
    } catch (e, s) {
      _handleError('Failed to add PSA log', e, s);
      // rethrow;
    }
  }

  void _handleError(String message, Object? error, StackTrace stackTrace) {
    debugPrint('PsaTrackerNotifier Error: $message');
    if (error != null) {
      debugPrint(error.toString());
    }
    debugPrint(stackTrace.toString());
    state = AsyncError(error ?? message, stackTrace);
  }
}
