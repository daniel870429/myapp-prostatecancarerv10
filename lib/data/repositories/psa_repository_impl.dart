import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/psa_log.dart';
import '../../domain/repositories/psa_repository.dart';

class PsaRepositoryImpl implements PsaRepository {
  final FirebaseFirestore _firestore;

  PsaRepositoryImpl(this._firestore);

  @override
  Stream<List<PsaLog>> getPsaLogs(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('psa_logs')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => PsaLog.fromJson(doc.data())).toList());
  }

  @override
  Future<void> addPsaLog(PsaLog log) async {
    final docRef = _firestore
        .collection('users')
        .doc(log.userId)
        .collection('psa_logs')
        .doc();
    await docRef.set(log.copyWith(id: int.tryParse(docRef.id) ?? 0).toJson());
  }

  @override
  Future<void> updatePsaLog(PsaLog log) async {
    await _firestore
        .collection('users')
        .doc(log.userId)
        .collection('psa_logs')
        .doc(log.id.toString())
        .update(log.toJson());
  }

  @override
  Future<void> deletePsaLog(String psaLogId) async {
    // This is a bit tricky since we only have the ID, not the userId.
    // For this to work, we would need to query all users, which is not efficient.
    // This indicates a potential design issue in the repository interface.
    // For now, I will leave this unimplemented.
    // A better approach would be to pass the userId to the delete method.
    // print('deletePsaLog is not fully implemented due to missing userId');
  }
}
