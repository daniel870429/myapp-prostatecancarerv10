import 'package:drift/drift.dart';
import '../datasources/local/database.dart';
import '../../domain/entities/psa_log.dart';

class PsaLogMapper {
  PsaLog toEntity(PsaLogDbEntity entity) {
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

  List<PsaLog> toEntityList(List<PsaLogDbEntity> entities) {
    return entities.map(toEntity).toList();
  }

  PsaLogsCompanion toCompanion(PsaLog entity) {
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
