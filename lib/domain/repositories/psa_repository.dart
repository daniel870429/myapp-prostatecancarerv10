import '../entities/psa_log.dart';

abstract class PsaRepository {
  Stream<List<PsaLog>> getPsaLogs(String userId);
  Future<void> addPsaLog(PsaLog psaLog);
  Future<void> updatePsaLog(PsaLog psaLog);
  Future<void> deletePsaLog(String psaLogId);
}
