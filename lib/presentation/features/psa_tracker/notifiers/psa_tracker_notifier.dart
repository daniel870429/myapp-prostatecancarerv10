import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/data_providers.dart';
import '../../../../domain/entities/psa_log.dart';

part 'psa_tracker_notifier.g.dart';

@riverpod
class PsaTrackerNotifier extends _$PsaTrackerNotifier {
  @override
  Stream<List<PsaLog>> build() {
    final user = ref.watch(authStateChangesProvider).asData?.value;
    if (user == null) {
      return Stream.value([]);
    }
    return ref.watch(psaRepositoryProvider).getPsaLogs(user.uid);
  }

  Future<void> addPsaLog({
    required double value,
    required DateTime timestamp,
  }) async {
    final user = ref.read(authStateChangesProvider).asData?.value;
    if (user == null) {
      return;
    }
    final repository = ref.read(psaRepositoryProvider);
    final newLog = PsaLog(
      id: 0, // ID will be set by the database
      value: value,
      recordedAt: timestamp,
      userId: user.uid,
    );
    await repository.addPsaLog(newLog);
  }

  Future<void> deletePsaLog(String id) async {
    final user = ref.read(authStateChangesProvider).asData?.value;
    if (user == null) {
      return;
    }
    final repository = ref.read(psaRepositoryProvider);
    await repository.deletePsaLog(id);
  }
}
