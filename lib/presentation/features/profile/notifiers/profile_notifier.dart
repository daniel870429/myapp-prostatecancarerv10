import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'profile_notifier.g.dart';

// Using an AsyncNotifier to handle the asynchronous operation of generating a report.
// The state will represent the result of this operation.
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  FutureOr<void> build() {
    // No initial state needed for this notifier as it's action-based.
  }

  // The core logic for generating and sharing the report, now living in the notifier.
  Future<void> generateAndShareReport({
    required VoidCallback onStart,
    required VoidCallback onDone,
    required Function(String) onError,
    required Rect? sharePositionOrigin,
  }) async {
    onStart(); // Signal the UI to show a loading indicator
    state = const AsyncValue.loading();

    try {
      // 1. Get the latest data by reading other providers.
      // final symptoms = await ref.read(symptomTrackerNotifierProvider.future);

      // 2. Generate the PDF using the injected service.
      // final pdfService = ref.read(pdfReportServiceProvider);
      // final pdfData = await pdfService.generateSymptomReport(symptoms);

      // 3. Save and share the file using the dedicated service.
      // final fileSharer = ref.read(fileSharerServiceProvider);
      // await fileSharer.saveAndShare(
      //   'symptom_report.pdf',
      //   pdfData,
      //   '這是我的症狀日誌總結報告',
      //   sharePositionOrigin: sharePositionOrigin,
      // );

      onDone(); // Signal the UI to hide the loading indicator
      state = const AsyncValue.data(null); // Reset state to idle
    } catch (e, st) {
      onDone(); // Ensure loading indicator is hidden on error
      onError('產生報告時發生錯誤: $e'); // Signal the UI to show an error
      state = AsyncValue.error(e, st); // Set the notifier state to error
    }
  }
}
