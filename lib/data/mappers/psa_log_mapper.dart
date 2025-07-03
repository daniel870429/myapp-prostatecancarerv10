import '../datasources/local/database.dart' as data;
import '../../domain/entities/psa_log.dart' as domain;

extension PsaLogMapper on data.PsaLogEntry {
  domain.PsaLog toDomain() {
    return domain.PsaLog(
      id: id,
      value: value,
      recordedAt: recordedAt,
      userId: userId,
      notes: notes,
      contextNotes: contextNotes,
      source: source,
    );
  }
}
