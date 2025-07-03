import '../datasources/local/database.dart' as data;
import '../../domain/entities/symptom_log.dart' as domain;

extension SymptomLogMapper on data.SymptomLogEntry {
  domain.SymptomLog toDomain() {
    return domain.SymptomLog(
      id: id,
      symptomName: symptomName,
      severity: severity,
      recordedAt: recordedAt,
      userId: userId,
      notes: notes,
    );
  }
}
