// lib/domain/repositories/symptom_repository.dart

import '../entities/symptom_log.dart';

/// Abstract interface for a repository that manages symptom log data.
///
/// This defines the contract for data operations related to symptom logs,
/// completely independent of the data source (e.g., local DB, remote API).
/// The Data layer will provide a concrete implementation of this interface.
abstract class SymptomRepository {
  /// Watches for changes to all symptom logs for a given user.
  ///
  /// Returns a [Stream] that emits a new list of [SymptomLog]s whenever
  /// the underlying data changes.
  Stream<List<SymptomLog>> watchAllSymptomLogs(String userId);

  /// Adds a new symptom log.
  Future<void> addSymptomLog(SymptomLog log);

  /// Updates an existing symptom log.
  Future<void> updateSymptomLog(SymptomLog log);

  /// Deletes a symptom log by its ID.
  Future<void> deleteSymptomLog(int id);
}
