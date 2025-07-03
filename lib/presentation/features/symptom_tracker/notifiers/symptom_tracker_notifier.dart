import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/data_providers.dart';
import '../../../../domain/entities/symptom_log.dart';
import '../../auth/notifiers/auth_notifier.dart';

part 'symptom_tracker_notifier.g.dart';

@riverpod
class SymptomTrackerNotifier extends _$SymptomTrackerNotifier {
  @override
  Stream<List<SymptomLog>> build() {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.value;

    if (user == null) {
      return Stream.value([]);
    }

    final repository = ref.watch(symptomRepositoryProvider);
    return repository.watchAllSymptomLogs(user.uid);
  }

  Future<void> addSymptom(
      String symptomName, int severity, String? notes) async {
    final user = ref.read(authNotifierProvider).value;
    if (user == null) {
      _handleError('User not authenticated', null, StackTrace.current);
      return;
    }

    final newLog = SymptomLog(
      id: 0,
      symptomName: symptomName,
      severity: severity,
      recordedAt: DateTime.now(),
      notes: notes,
      userId: user.uid,
    );

    final repository = ref.read(symptomRepositoryProvider);
    try {
      await repository.addSymptomLog(newLog);
    } catch (e, s) {
      _handleError('Failed to add symptom', e, s);
      // Optionally, rethrow to be caught by a UI-level error handler
      // rethrow;
    }
  }

  Future<void> deleteSymptom(int id) async {
    final user = ref.read(authNotifierProvider).value;
    if (user == null) {
      _handleError('User not authenticated', null, StackTrace.current);
      return;
    }

    final repository = ref.read(symptomRepositoryProvider);
    try {
      await repository.deleteSymptomLog(id, user.uid);
    } catch (e, s) {
      _handleError('Failed to delete symptom', e, s);
      // rethrow;
    }
  }

  void _handleError(String message, Object? error, StackTrace stackTrace) {
    debugPrint('SymptomTrackerNotifier Error: $message');
    if (error != null) {
      debugPrint(error.toString());
    }
    debugPrint(stackTrace.toString());
    state = AsyncError(error ?? message, stackTrace);
  }
}
