import '../../domain/entities/psa_log.dart';
import '../../domain/repositories/psa_repository.dart';
import '../datasources/local/database.dart';
import '../mappers/psa_log_mapper.dart';

class PsaRepositoryImpl implements PsaRepository {
  final PsaLogDao _psaLogDao;

  PsaRepositoryImpl(this._psaLogDao);

  @override
  Stream<List<PsaLog>> getPsaLogs(String userId) {
    return _psaLogDao
        .watchPsaLogs(userId)
        .map((entities) => entities.map(PsaLogMapper.toEntity).toList());
  }

  @override
  Future<void> addPsaLog(PsaLog log) async {
    final companion = PsaLogMapper.toCompanion(log);
    await _psaLogDao.insertPsaLog(companion);
    // TODO: Add to sync queue
  }

  @override
  Future<void> updatePsaLog(PsaLog log) async {
    final companion = PsaLogMapper.toCompanion(log);
    await _psaLogDao.updatePsaLog(companion);
    // TODO: Add to sync queue
  }

  @override
  Future<void> deletePsaLog(String psaLogId, String userId) async {
    await _psaLogDao.deletePsaLog(psaLogId);
    // TODO: Add to sync queue
  }
}
