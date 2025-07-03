import 'package:drift/drift.dart';
import '../../domain/entities/symptom_log.dart';
import '../datasources/local/database.dart';

class SymptomLogMapper {
  static SymptomLog toEntity(SymptomLogDbEntity entity) {
    return SymptomLog(
      id: entity.id,
      name: entity.name,
      severity: entity.severity,
      timestamp: entity.timestamp,
      comments: entity.comments,
      userId: '', // This will be handled by the repository
    );
  }

  static SymptomLogsCompanion toCompanion(SymptomLog entity) {
    return SymptomLogsCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      severity: Value(entity.severity),
      timestamp: Value(entity.timestamp),
      comments: Value(entity.comments),
    );
  }
}
