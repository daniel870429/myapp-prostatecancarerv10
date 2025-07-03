import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/symptom_log.dart';
import '../../domain/repositories/symptom_repository.dart';

class SymptomRepositoryImpl implements SymptomRepository {
  final FirebaseFirestore _firestore;

  SymptomRepositoryImpl(this._firestore);

  @override
  Stream<List<SymptomLog>> watchAllSymptomLogs(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('symptom_logs')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => SymptomLog.fromJson(doc.data()))
            .toList());
  }

  @override
  Future<void> addSymptomLog(SymptomLog log) async {
    final docRef = _firestore
        .collection('users')
        .doc(log.userId)
        .collection('symptom_logs')
        .doc();
    await docRef.set(log.copyWith(id: int.tryParse(docRef.id) ?? 0).toJson());
  }

  @override
  Future<void> updateSymptomLog(SymptomLog log) async {
    await _firestore
        .collection('users')
        .doc(log.userId)
        .collection('symptom_logs')
        .doc(log.id.toString())
        .update(log.toJson());
  }

  @override
  Future<void> deleteSymptomLog(int id, String userId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('symptom_logs')
        .doc(id.toString())
        .delete();
  }
}
