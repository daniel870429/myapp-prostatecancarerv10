import '../../domain/entities/symptom_log.dart';
import '../../domain/repositories/symptom_repository.dart';
import '../datasources/local/database.dart';
import '../mappers/symptom_log_mapper.dart';

class SymptomRepositoryImpl implements SymptomRepository {
  final SymptomLogDao _symptomLogDao;

  SymptomRepositoryImpl(this._symptomLogDao);

  @override
  Stream<List<SymptomLog>> watchAllSymptomLogs(String userId) {
    return _symptomLogDao.watchAllSymptomLogs().map((entities) =>
        entities.map(SymptomLogMapper.toEntity).toList());
  }

  @override
  Future<void> addSymptomLog(SymptomLog log) async {
    final companion = SymptomLogMapper.toCompanion(log);
    await _symptomLogDao.insertSymptomLog(companion);
    // TODO: Add to sync queue
  }

  @override
  Future<void> updateSymptomLog(SymptomLog log) async {
    final companion = SymptomLogMapper.toCompanion(log);
    await _symptomLogDao.updateSymptomLog(companion);
    // TODO: Add to sync queue
  }

  @override
  Future<void> deleteSymptomLog(int id, String userId) async {
    await _symptomLogDao.deleteSymptomLog(id);
    // TODO: Add to sync queue
  }
}
