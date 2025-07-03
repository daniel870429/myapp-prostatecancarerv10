import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'datasources/local/database.dart';
import 'repositories/auth_repository_impl.dart';
import 'repositories/psa_repository_impl.dart';
import 'repositories/symptom_repository_impl.dart';
import '../domain/entities/psa_log.dart';
import '../domain/entities/symptom_log.dart';
import '../domain/repositories/psa_repository.dart';
import '../domain/repositories/symptom_repository.dart';

// This file contains providers for the data layer of the application.
// It is used to provide instances of repositories and other data sources
// to the rest of the application.

// -- Firebase --
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

// -- Database --
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final symptomLogDaoProvider = Provider<SymptomLogDao>((ref) {
  final db = ref.watch(databaseProvider);
  return db.symptomLogDao;
});

final psaLogDaoProvider = Provider<PsaLogDao>((ref) {
  final db = ref.watch(databaseProvider);
  return db.psaLogDao;
});

// -- Repositories --
final symptomRepositoryProvider = Provider<SymptomRepository>((ref) {
  final symptomLogDao = ref.watch(symptomLogDaoProvider);
  return SymptomRepositoryImpl(symptomLogDao);
});

final psaRepositoryProvider = Provider<PsaRepository>((ref) {
  final psaLogDao = ref.watch(psaLogDaoProvider);
  return PsaRepositoryImpl(psaLogDao);
});

// -- Data Streams --
final authStateChangesProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});

final symptomsStreamProvider = StreamProvider<List<SymptomLog>>((ref) {
  final symptomRepository = ref.watch(symptomRepositoryProvider);
  final user = ref.watch(authStateChangesProvider).asData?.value;
  if (user != null) {
    return symptomRepository.watchAllSymptomLogs(user.uid);
  }
  return Stream.value([]);
});

final psaLogsStreamProvider = StreamProvider<List<PsaLog>>((ref) {
  final psaRepository = ref.watch(psaRepositoryProvider);
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user != null) {
    return psaRepository.getPsaLogs(user.uid);
  }
  return Stream.value([]);
});
