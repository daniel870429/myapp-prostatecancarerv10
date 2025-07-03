import 'package:drift/drift.dart';
import '../../../domain/entities/psa_log.dart';
import 'database_unsupported.dart'
    if (dart.library.io) 'database_native.dart'
    if (dart.library.html) 'database_web.dart';

part 'database.g.dart';

@DataClassName('SymptomLogDbEntity')
class SymptomLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get severity => integer()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get comments => text()();
}

@DataClassName('PsaLogDbEntity')
class PsaLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get value => real()();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get userId => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get contextNotes => text().nullable()();
  IntColumn get source => integer().map(const PsaLogSourceConverter())();
}

class PsaLogSourceConverter extends TypeConverter<PsaLogSource, int> {
  const PsaLogSourceConverter();
  @override
  PsaLogSource fromSql(int fromDb) {
    return PsaLogSource.values[fromDb];
  }

  @override
  int toSql(PsaLogSource value) {
    return value.index;
  }
}

@DriftDatabase(tables: [SymptomLogs, PsaLogs], daos: [SymptomLogDao, PsaLogDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [SymptomLogs])
class SymptomLogDao extends DatabaseAccessor<AppDatabase>
    with _$SymptomLogDaoMixin {
  SymptomLogDao(super.db);

  Future<List<SymptomLogDbEntity>> getAllSymptomLogs() =>
      select(symptomLogs).get();
  Stream<List<SymptomLogDbEntity>> watchAllSymptomLogs() =>
      select(symptomLogs).watch();
  Future<void> insertSymptomLog(SymptomLogsCompanion log) =>
      into(symptomLogs).insert(log);
  Future<void> updateSymptomLog(SymptomLogsCompanion log) =>
      update(symptomLogs).replace(log);
  Future<void> deleteSymptomLog(int id) =>
      (delete(symptomLogs)..where((t) => t.id.equals(id))).go();
}

@DriftAccessor(tables: [PsaLogs])
class PsaLogDao extends DatabaseAccessor<AppDatabase> with _$PsaLogDaoMixin {
  PsaLogDao(super.db);

  Stream<List<PsaLogDbEntity>> watchPsaLogs(String userId) =>
      (select(psaLogs)..where((t) => t.userId.equals(userId))).watch();
  Future<void> insertPsaLog(PsaLogsCompanion log) => into(psaLogs).insert(log);
  Future<void> updatePsaLog(PsaLogsCompanion log) =>
      update(psaLogs).replace(log);
  Future<void> deletePsaLog(String id) =>
      (delete(psaLogs)..where((t) => t.id.equals(int.parse(id)))).go();
}
