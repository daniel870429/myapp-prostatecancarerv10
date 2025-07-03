// lib/data/datasources/local/database.dart

import 'package:drift/drift.dart';
import 'database_web.dart'
    if (dart.library.io) 'package:myapp/data/datasources/local/database_native.dart';
import '../../../domain/entities/psa_log.dart' as domain;

part 'database.g.dart';

// Renamed table to avoid name collision with domain entity
class SymptomLogEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get symptomName => text().withLength(min: 1, max: 100)();
  IntColumn get severity => integer().withDefault(const Constant(0))();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get notes => text().nullable()();
  TextColumn get userId => text()();
}

// Renamed table to avoid name collision with domain entity
class PsaLogEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get value => real()();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get notes => text().nullable()();
  TextColumn get userId => text()();
  TextColumn get contextNotes => text().nullable()();
  IntColumn get source =>
      intEnum<domain.PsaLogSource>().withDefault(const Constant(0))();
}

@DriftAccessor(tables: [SymptomLogEntries])
class SymptomLogDao extends DatabaseAccessor<AppDatabase>
    with _$SymptomLogDaoMixin {
  SymptomLogDao(super.db);

  // DAO now returns the unambiguous Drift-generated data class 'SymptomLogEntry'
  Stream<List<SymptomLogEntry>> watchAllLogs(String userId) {
    return (select(symptomLogEntries)
          ..where((tbl) => tbl.userId.equals(userId))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.recordedAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  Future<int> insertLog(SymptomLogEntriesCompanion log) =>
      into(symptomLogEntries).insert(log);

  Future<bool> updateLog(SymptomLogEntriesCompanion log) =>
      update(symptomLogEntries).replace(log);

  Future<int> deleteLog(int id) =>
      (delete(symptomLogEntries)..where((tbl) => tbl.id.equals(id))).go();
}

@DriftAccessor(tables: [PsaLogEntries])
class PsaLogDao extends DatabaseAccessor<AppDatabase> with _$PsaLogDaoMixin {
  PsaLogDao(super.db);

  // DAO now returns the unambiguous Drift-generated data class 'PsaLogEntry'
  Stream<List<PsaLogEntry>> watchAllPsaLogs(String userId) {
    return (select(psaLogEntries)
          ..where((tbl) => tbl.userId.equals(userId))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.recordedAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  Future<int> insertPsaLog(PsaLogEntriesCompanion log) =>
      into(psaLogEntries).insert(log);

  Future<bool> updatePsaLog(PsaLogEntriesCompanion log) =>
      update(psaLogEntries).replace(log);

  Future<int> deletePsaLog(int id) =>
      (delete(psaLogEntries)..where((tbl) => tbl.id.equals(id))).go();
}

@DriftDatabase(tables: [SymptomLogEntries, PsaLogEntries], daos: [SymptomLogDao, PsaLogDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 3) {
            // This migration logic needs to be adapted if table names change.
            // For this fix, we assume the underlying SQL table name remains 'psa_logs'.
            // Drift is smart about this if you only change the Dart class name.
            await m.addColumn(psaLogEntries, psaLogEntries.contextNotes);
            await m.addColumn(psaLogEntries, psaLogEntries.source);
          }
        },
      );
}
