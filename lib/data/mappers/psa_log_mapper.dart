import 'package:drift/drift.dart';
import '../../domain/entities/psa_log.dart';
import '../datasources/local/database.dart';

class PsaLogMapper {
  static PsaLog toEntity(PsaLogDbEntity entity) {
    return PsaLog(
      id: entity.id,
      value: entity.value,
      recordedAt: entity.recordedAt,
      userId: entity.userId,
      notes: entity.notes,
      contextNotes: entity.contextNotes,
      source: entity.source,
    );
  }

  static PsaLogsCompanion toCompanion(PsaLog entity) {
    return PsaLogsCompanion(
      id: Value(entity.id),
      value: Value(entity.value),
      recordedAt: Value(entity.recordedAt),
      userId: Value(entity.userId),
      notes: Value(entity.notes),
      contextNotes: Value(entity.contextNotes),
      source: Value(entity.source),
    );
  }
}
