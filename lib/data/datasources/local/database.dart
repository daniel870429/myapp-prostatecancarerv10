// lib/data/datasources/local/database.dart

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

// Define the table for symptom logs, mirroring the domain entity.
class SymptomLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get symptomName => text().withLength(min: 1, max: 100)();
  IntColumn get severity => integer().withDefault(const Constant(0))();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get notes => text().nullable()();
  TextColumn get userId => text()();
}

// DAO for SymptomLogs table
@DriftAccessor(tables: [SymptomLogs])
class SymptomLogDao extends DatabaseAccessor<AppDatabase> with _$SymptomLogDaoMixin {
  SymptomLogDao(super.db);

  // Watches for all logs for a specific user, ordered by date
  Stream<List<SymptomLog>> watchAllLogs(String userId) {
    return (select(symptomLogs)..where((tbl) => tbl.userId.equals(userId))..orderBy([(t) => OrderingTerm(expression: t.recordedAt, mode: OrderingMode.desc)])).watch();
  }

  // Inserts a new log
  Future<int> insertLog(SymptomLogsCompanion log) => into(symptomLogs).insert(log);

  // Updates a log
  Future<bool> updateLog(SymptomLogsCompanion log) => update(symptomLogs).replace(log);

  // Deletes a log
  Future<int> deleteLog(int id) => (delete(symptomLogs)..where((tbl) => tbl.id.equals(id))).go();
}

@DriftDatabase(tables: [SymptomLogs], daos: [SymptomLogDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
