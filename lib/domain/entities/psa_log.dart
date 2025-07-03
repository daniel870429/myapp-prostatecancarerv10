import 'package:freezed_annotation/freezed_annotation.dart';

part 'psa_log.freezed.dart';
part 'psa_log.g.dart';

enum PsaLogSource {
  userUploaded,
  clinicianVerified,
}

@freezed
abstract class PsaLog with _$PsaLog {
  const PsaLog._();
  const factory PsaLog({
    required int id,
    required double value,
    required DateTime recordedAt,
    required String userId,
    String? notes,
    String? contextNotes,
    @Default(PsaLogSource.userUploaded) PsaLogSource source,
  }) = _PsaLog;

  factory PsaLog.fromJson(Map<String, dynamic> json) => _$PsaLogFromJson(json);
}
