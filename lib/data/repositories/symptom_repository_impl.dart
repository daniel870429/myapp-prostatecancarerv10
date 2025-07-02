// lib/data/repositories/symptom_repository_impl.dart

import 'package:drift/drift.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/symptom_log.dart' as domain;
import '../../domain/repositories/symptom_repository.dart';
import '../datasources/local/database.dart';

/// Concrete implementation of the [SymptomRepository] interface.
///
/// This class communicates with the local database via the [SymptomLogDao]
/// and maps the data models to the domain entities.
class SymptomRepositoryImpl implements SymptomRepository {
  final SymptomLogDao _symptomLogDao;
  final FirebaseFirestore _firestore;

  SymptomRepositoryImpl(this._symptomLogDao, this._firestore);

  @override
  Stream<List<domain.SymptomLog>> watchAllSymptomLogs(String userId) {
    // Watch the DAO stream and map the results to domain entities
    return _symptomLogDao.watchAllLogs(userId).map((dbLogs) {
      return dbLogs.map((dbLog) => _toDomain(dbLog)).toList();
    });
  }

  @override
  Future<void> addSymptomLog(domain.SymptomLog log) async {
    // Write to local DB first for immediate UI feedback
    final dbLog = _toDbCompanion(log);
    final id = await _symptomLogDao.insertLog(dbLog);

    // Then, write to Firestore for backup and sync
    // Use the ID from the local DB as the document ID in Firestore
    await _firestore
        .collection('users')
        .doc(log.userId)
        .collection('symptom_logs')
        .doc(id.toString())
        .set(_toFirestore(log, id));
  }

  @override
  Future<void> updateSymptomLog(domain.SymptomLog log) {
    final dbLog = _toDbCompanion(log);
    return _symptomLogDao.updateLog(dbLog);
  }

  @override
  Future<void> deleteSymptomLog(int id) async {
    // We need to know the user ID to delete from Firestore.
    // In a real app, you might fetch the log first or pass the userId.
    // For now, we'll just delete from the local DB.
    // TODO: Implement Firestore deletion
    await _symptomLogDao.deleteLog(id);
  }

  // --- Mappers ---

  /// Maps a database [SymptomLog] data class to a [domain.SymptomLog] entity.
  domain.SymptomLog _toDomain(SymptomLog dbLog) {
    return domain.SymptomLog(
      id: dbLog.id,
      symptomName: dbLog.symptomName,
      severity: dbLog.severity,
      recordedAt: dbLog.recordedAt,
      notes: dbLog.notes,
      userId: dbLog.userId,
    );
  }

  /// Maps a [domain.SymptomLog] entity to a [SymptomLogsCompanion] for inserts/updates.
  SymptomLogsCompanion _toDbCompanion(domain.SymptomLog log) {
    return SymptomLogsCompanion(
      id: log.id == 0 ? const Value.absent() : Value(log.id),
      symptomName: Value(log.symptomName),
      severity: Value(log.severity),
      recordedAt: Value(log.recordedAt),
      notes: Value(log.notes),
      userId: Value(log.userId),
    );
  }

  /// Maps a [domain.SymptomLog] entity to a Map for Firestore.
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
