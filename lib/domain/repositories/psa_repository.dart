import '../entities/psa_log.dart';

/// Abstract interface for a repository that manages PSA log data.
abstract class PsaRepository {
  /// Watches for changes to all PSA logs for a given user.
  Stream<List<PsaLog>> watchAllPsaLogs(String userId);

  /// Adds a new PSA log.
  Future<void> addPsaLog(PsaLog log);

  /// Updates an existing PSA log.
  Future<void> updatePsaLog(PsaLog log);

  /// Deletes a PSA log by its ID.
  Future<void> deletePsaLog(int id, String userId);
}
