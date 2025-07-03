import 'package:drift/drift.dart' hide JsonKey;
import '../datasources/local/database.dart';
import '../../domain/entities/symptom_log.dart';

class SymptomLogMapper {
  SymptomLog fromDb(SymptomLogDbEntity entity, String userId) {
    return SymptomLog(
      id: entity.id,
      name: entity.name,
      severity: entity.severity,
      timestamp: entity.timestamp,
      comments: entity.comments,
      userId: userId,
    );
  }

  SymptomLogsCompanion toDb(SymptomLog symptomLog) {
    return SymptomLogsCompanion(
      id: Value(symptomLog.id),
      name: Value(symptomLog.name),
      severity: Value(symptomLog.severity),
      timestamp: Value(symptomLog.timestamp),
      comments: Value(symptomLog.comments),
    );
  }
}
