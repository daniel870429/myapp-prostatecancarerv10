import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/data_providers.dart';
import '../../../../domain/entities/symptom_log.dart';

part 'symptom_tracker_notifier.g.dart';

@riverpod
class SymptomTrackerNotifier extends _$SymptomTrackerNotifier {
  @override
  Stream<List<SymptomLog>> build() {
    final user = ref.watch(authStateChangesProvider).asData?.value;
    if (user == null) {
      return Stream.value([]);
    }
    return ref.watch(symptomRepositoryProvider).watchAllSymptomLogs(user.uid);
  }

  Future<void> addSymptomLog({
    required String name,
    required int severity,
    required DateTime timestamp,
    required String comments,
  }) async {
    final user = ref.read(authStateChangesProvider).asData?.value;
    if (user == null) {
      return;
    }
    final newLog = SymptomLog(
      id: 0,
      name: name,
      severity: severity,
      timestamp: timestamp,
      comments: comments,
      userId: user.uid,
    );
    final symptomRepository = ref.read(symptomRepositoryProvider);
    await symptomRepository.addSymptomLog(newLog);
  }

  Future<void> deleteSymptomLog(int id) async {
    final user = ref.read(authStateChangesProvider).asData?.value;
    if (user == null) {
      return;
    }
    final symptomRepository = ref.read(symptomRepositoryProvider);
    await symptomRepository.deleteSymptomLog(id, user.uid);
  }
}
