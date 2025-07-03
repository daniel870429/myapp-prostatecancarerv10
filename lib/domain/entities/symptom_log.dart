import 'package:freezed_annotation/freezed_annotation.dart';

part 'symptom_log.freezed.dart';
part 'symptom_log.g.dart';

@freezed
class SymptomLog with _$SymptomLog {
  const factory SymptomLog({
    required int id,
    required String name,
    required int severity,
    required DateTime timestamp,
    required String comments,
    required String userId,
  }) = _SymptomLog;

  factory SymptomLog.fromJson(Map<String, dynamic> json) =>
      _$SymptomLogFromJson(json);
}
