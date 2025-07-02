// lib/data/data_providers.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/symptom_repository.dart';
import 'datasources/local/database.dart';
import 'repositories/auth_repository_impl.dart';
import 'repositories/symptom_repository_impl.dart';

part 'data_providers.g.dart';

// 1. Provider for the database instance (singleton)
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

// 2. Provider for the SymptomLogDao
@riverpod
SymptomLogDao symptomLogDao(Ref ref) {
  return ref.watch(appDatabaseProvider).symptomLogDao;
}

// 3. Provider for the SymptomRepository implementation
@riverpod
SymptomRepository symptomRepository(Ref ref) {
  return SymptomRepositoryImpl(
    ref.watch(symptomLogDaoProvider),
    ref.watch(firebaseFirestoreProvider),
  );
}

// 4. Provider for the FirebaseAuth instance
@riverpod
FirebaseAuth firebaseAuth(Ref ref) {
  return FirebaseAuth.instance;
}

// 5. Provider for the AuthRepository implementation
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(ref.watch(firebaseAuthProvider));
}

// 6. Provider for the FirebaseFirestore instance
@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) {
  return FirebaseFirestore.instance;
}
