import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart';
import '../../domain/entities/symptom_log.dart' as domain;
import '../../domain/repositories/symptom_repository.dart';
import '../datasources/local/database.dart';
import '../mappers/symptom_log_mapper.dart';

class SymptomRepositoryImpl implements SymptomRepository {
  final SymptomLogDao _symptomLogDao;
  final FirebaseFirestore _firestore;

  SymptomRepositoryImpl(this._symptomLogDao, this._firestore);

  @override
  Stream<List<domain.SymptomLog>> watchAllSymptomLogs(String userId) {
    return _symptomLogDao.watchAllLogs(userId).map((dbEntries) {
      return dbEntries.map((entry) => entry.toDomain()).toList();
    });
  }

  @override
  Future<void> addSymptomLog(domain.SymptomLog log) async {
    final dbLog = _toDbCompanion(log);
    final id = await _symptomLogDao.insertLog(dbLog);
    await _firestore.collection('users').doc(log.userId).collection('symptom_logs').doc(id.toString()).set(_toFirestore(log, id));
  }

  @override
  Future<void> updateSymptomLog(domain.SymptomLog log) async {
    final dbLog = _toDbCompanion(log);
    await _symptomLogDao.updateLog(dbLog);
    await _firestore.collection('users').doc(log.userId).collection('symptom_logs').doc(log.id.toString()).update(_toFirestore(log, log.id));
  }

  @override
  Future<void> deleteSymptomLog(int id, String userId) async {
    await _symptomLogDao.deleteLog(id);
    await _firestore.collection('users').doc(userId).collection('symptom_logs').doc(id.toString()).delete();
  }

  // --- Mappers ---

  SymptomLogEntriesCompanion _toDbCompanion(domain.SymptomLog log) {
    return SymptomLogEntriesCompanion(
      id: log.id == 0 ? const Value.absent() : Value(log.id),
      symptomName: Value(log.symptomName),
      severity: Value(log.severity),
      recordedAt: Value(log.recordedAt),
      notes: Value(log.notes),
      userId: Value(log.userId),
    );
  }

  Map<String, dynamic> _toFirestore(domain.SymptomLog log, int id) {
    return {
      'id': id,
      'symptomName': log.symptomName,
      'severity': log.severity,
      'recordedAt': Timestamp.fromDate(log.recordedAt),
      'notes': log.notes,
      'userId': log.userId,
    };
  }
}
