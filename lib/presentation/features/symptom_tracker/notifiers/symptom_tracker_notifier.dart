// lib/presentation/features/symptom_tracker/notifiers/symptom_tracker_notifier.dart

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

    // If the user is not logged in, return an empty stream.
    if (user == null) {
      return Stream.value([]);
    }
    
    final repository = ref.watch(symptomRepositoryProvider);
    return repository.watchAllSymptomLogs(user.uid);
  }

  Future<void> addSymptom(String symptomName, int severity, String? notes) async {
    final user = ref.read(authNotifierProvider).value;
    if (user == null) return; // Or throw an error

    final newLog = SymptomLog(
      id: 0, // DB will auto-increment
      symptomName: symptomName,
      severity: severity,
      recordedAt: DateTime.now(),
      notes: notes,
      userId: user.uid,
    );

    final repository = ref.read(symptomRepositoryProvider);
    await repository.addSymptomLog(newLog);
  }

  Future<void> deleteSymptom(int id) async {
    final repository = ref.read(symptomRepositoryProvider);
    await repository.deleteSymptomLog(id);
  }
}
