import '../../domain/entities/psa_log.dart';

abstract class PsaRepository {
  Stream<List<PsaLog>> getPsaLogs(String userId);
  Future<void> addPsaLog(PsaLog log);
  Future<void> updatePsaLog(PsaLog log);
  Future<void> deletePsaLog(String psaLogId, String userId);
}
