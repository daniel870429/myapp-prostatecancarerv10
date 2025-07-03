import 'package:flutter_test/flutter_test.dart';
import 'dart:typed_data';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/services/pdf_report_service.dart';
import 'package:myapp/domain/entities/symptom_log.dart';
import 'package:myapp/presentation/features/profile/notifiers/profile_notifier.dart';
import 'package:myapp/presentation/features/symptom_tracker/notifiers/symptom_tracker_notifier.dart';

import 'profile_notifier_test.mocks.dart';

import 'package:myapp/core/services/file_sharer_service.dart';

// 1. Generate mocks for the dependencies
@GenerateMocks([PdfReportService, SymptomTrackerNotifier, FileSharerService])
void main() {
  // 2. Declare test variables
  late MockPdfReportService mockPdfReportService;
  late MockSymptomTrackerNotifier mockSymptomTrackerNotifier;
  late MockFileSharerService mockFileSharerService;
  late ProviderContainer container;
  late List<SymptomLog> testSymptomLogs;

  setUp(() {
    // 3. Initialize mocks and container for each test
    mockPdfReportService = MockPdfReportService();
    mockSymptomTrackerNotifier = MockSymptomTrackerNotifier();
    mockFileSharerService = MockFileSharerService();
    testSymptomLogs = [
      SymptomLog(
        id: 1,
        name: 'Fatigue',
        severity: 5,
        timestamp: DateTime.now(),
        comments: 'no comments',
        userId: 'test_user',
      ),
    ];

    // Create a ProviderContainer with overrides for the dependencies
    container = ProviderContainer(
      overrides: [
        symptomTrackerNotifierProvider.overrideWith(
          () => mockSymptomTrackerNotifier,
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('Initial state is AsyncData(null)', () {
    // 4. Test the initial state
    final listener = ProviderListener<AsyncValue<void>>();
    container.listen(profileNotifierProvider, listener.call,
        fireImmediately: true);

    // Assert
    expect(listener.states.first, const AsyncData<void>(null));
  });

  group('generateAndShareReport', () {
    test('success case: orchestrates service calls and manages state',
        () async {
      // Arrange
      final listener = ProviderListener<AsyncValue<void>>();
      container.listen(profileNotifierProvider, listener.call,
          fireImmediately: true);
      final pdfData = Uint8List(0);

      // Stub dependencies for success
      when(mockSymptomTrackerNotifier.future)
          .thenAnswer((_) async => testSymptomLogs);
      when(mockPdfReportService.generateSymptomReport(any))
          .thenAnswer((_) async => pdfData);
      when(mockFileSharerService.saveAndShare(any, any, any))
          .thenAnswer((_) async {});

      // Act
      await container
          .read(profileNotifierProvider.notifier)
          .generateAndShareReport(
            onStart: () {},
            onDone: () {},
            onError: (e) {},
            sharePositionOrigin: null,
          );

      // Assert
      // Verify the order of operations
      verifyInOrder([
        mockSymptomTrackerNotifier.future,
        mockPdfReportService.generateSymptomReport(testSymptomLogs),
        mockFileSharerService.saveAndShare(
          'symptom_report.pdf',
          pdfData,
          '這是我的症狀日誌總結報告',
        ),
      ]);

      // Verify state transitions: Initial -> Loading -> Data(null)
      expect(listener.states.length, 3);
      expect(listener.states[0], isA<AsyncData>());
      expect(listener.states[1], isA<AsyncLoading>());
      expect(listener.states[2], isA<AsyncData>());
    });

    test('failure case: handles error from pdf service', () async {
      // Arrange
      final listener = ProviderListener<AsyncValue<void>>();
      container.listen(profileNotifierProvider, listener.call,
          fireImmediately: true);
      final exception = Exception('PDF generation failed');

      // Stub dependencies for failure
      when(mockSymptomTrackerNotifier.future)
          .thenAnswer((_) async => testSymptomLogs);
      when(mockPdfReportService.generateSymptomReport(any))
          .thenThrow(exception);

      // Act
      await container
          .read(profileNotifierProvider.notifier)
          .generateAndShareReport(
            onStart: () {},
            onDone: () {},
            onError: (e) {},
            sharePositionOrigin: null,
          );

      // Assert
      // Verify state transitions: Initial -> Loading -> Error
      expect(listener.states.length, 3);
      expect(listener.states[0], isA<AsyncData>());
      expect(listener.states[1], isA<AsyncLoading>());
      expect(listener.states[2], isA<AsyncError>());
      // Verify the error is the one we threw
      final error = listener.states[2] as AsyncError;
      expect(error.error, exception);
    });
  });
}

// Helper class for listening to provider state changes
class ProviderListener<T> {
  final List<T> states = [];
  void call(T? previous, T next) {
    states.add(next);
  }
}
