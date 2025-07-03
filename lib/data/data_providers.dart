// lib/data/data_providers.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/services/file_sharer_service.dart';
import '../core/services/pdf_report_service.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/psa_repository.dart';
import '../domain/repositories/symptom_repository.dart';
import 'datasources/local/database.dart';
import 'repositories/auth_repository_impl.dart';
import 'repositories/psa_repository_impl.dart';
import 'repositories/symptom_repository_impl.dart';

part 'data_providers.g.dart';

@riverpod
FirebaseAuth firebaseAuth(Ref ref) {
  return FirebaseAuth.instance;
}

@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) {
  return FirebaseFirestore.instance;
}

@riverpod
FirebaseStorage firebaseStorage(Ref ref) {
  return FirebaseStorage.instance;
}

@riverpod
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

@riverpod
GenerativeModel generativeModel(Ref ref) {
  // Initialize the Gemini Developer API backend service
  // and create a `GenerativeModel` instance.
  return FirebaseAI.googleAI().generativeModel(
    model: 'gemini-1.5-flash', // Updated model name
    generationConfig: GenerationConfig(
      temperature: 0.4,
      topK: 32,
      topP: 1,
      maxOutputTokens: 4096,
    ),
  );
}

// --- DAOs ---
@riverpod
SymptomLogDao symptomLogDao(Ref ref) =>
    ref.watch(appDatabaseProvider).symptomLogDao;

@riverpod
PsaLogDao psaLogDao(Ref ref) => ref.watch(appDatabaseProvider).psaLogDao;

// --- Repositories ---
@riverpod
AuthRepository authRepository(Ref ref) =>
    AuthRepositoryImpl(ref.watch(firebaseAuthProvider));

@riverpod
SymptomRepository symptomRepository(Ref ref) => SymptomRepositoryImpl(
      ref.watch(symptomLogDaoProvider),
      ref.watch(firebaseFirestoreProvider),
    );

@riverpod
PsaRepository psaRepository(Ref ref) => PsaRepositoryImpl(
      ref.watch(psaLogDaoProvider),
      ref.watch(firebaseFirestoreProvider),
    );

// --- App Services ---
@riverpod
PdfReportService pdfReportService(Ref ref) {
  return PdfReportService();
}

@riverpod
FileSharerService fileSharerService(Ref ref) {
  return FileSharerService();
}
