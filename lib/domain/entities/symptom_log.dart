// lib/domain/entities/symptom_log.dart

/// Represents a single symptom log entry.
///
/// This is a pure, framework-agnostic business object. It contains the core
/// business data and logic, without any dependencies on the data or presentation layers.
class SymptomLog {
  const SymptomLog({
    required this.id,
    required this.symptomName,
    required this.severity,
    required this.recordedAt,
    this.notes,
    required this.userId,
  });

  final int id;
  final String symptomName;
  final int severity; // e.g., 0-10 scale
  final DateTime recordedAt;
  final String? notes;
  final String userId;
}
