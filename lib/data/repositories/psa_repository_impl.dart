import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart';
import '../datasources/local/database.dart';
import '../mappers/psa_log_mapper.dart';
import '../../domain/entities/psa_log.dart' as domain;
import '../../domain/repositories/psa_repository.dart';

class PsaRepositoryImpl implements PsaRepository {
  final PsaLogDao _psaLogDao;
  final FirebaseFirestore _firestore;

  PsaRepositoryImpl(this._psaLogDao, this._firestore);

  @override
  Stream<List<domain.PsaLog>> watchAllPsaLogs(String userId) {
    return _psaLogDao.watchAllPsaLogs(userId).map((dbLogs) {
      return dbLogs.map((dbLog) => dbLog.toDomain()).toList();
    });
  }

  @override
  Future<void> addPsaLog(domain.PsaLog log) async {
    final dbLog = _toDbCompanion(log);
    final id = await _psaLogDao.insertPsaLog(dbLog);
    await _firestore.collection('users').doc(log.userId).collection('psa_logs').doc(id.toString()).set(_toFirestore(log, id));
  }

  @override
  Future<void> updatePsaLog(domain.PsaLog log) async {
    final dbLog = _toDbCompanion(log);
    await _psaLogDao.updatePsaLog(dbLog);
    await _firestore.collection('users').doc(log.userId).collection('psa_logs').doc(log.id.toString()).update(_toFirestore(log, log.id));
  }

  @override
  Future<void> deletePsaLog(int id, String userId) async {
    await _psaLogDao.deletePsaLog(id);
    await _firestore.collection('users').doc(userId).collection('psa_logs').doc(id.toString()).delete();
  }

  // --- Mappers ---

  PsaLogEntriesCompanion _toDbCompanion(domain.PsaLog log) {
    return PsaLogEntriesCompanion(
      id: log.id == 0 ? const Value.absent() : Value(log.id),
      value: Value(log.value),
      recordedAt: Value(log.recordedAt),
      notes: Value(log.notes),
      userId: Value(log.userId),
      contextNotes: Value(log.contextNotes),
      source: Value(log.source),
    );
  }

  Map<String, dynamic> _toFirestore(domain.PsaLog log, int id) {
    return {
      'id': id,
      'value': log.value,
      'recordedAt': Timestamp.fromDate(log.recordedAt),
      'notes': log.notes,
      'userId': log.userId,
      'contextNotes': log.contextNotes,
      'source': log.source.index,
    };
  }
}
