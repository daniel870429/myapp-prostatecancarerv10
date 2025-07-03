import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/data/data_providers.dart';
import 'package:myapp/domain/entities/symptom_log.dart';
import 'package:myapp/domain/repositories/auth_repository.dart';
import 'package:myapp/domain/repositories/symptom_repository.dart';
import 'package:myapp/presentation/features/symptom_tracker/pages/symptom_tracker_page.dart';
import 'package:myapp/presentation/features/symptom_tracker/widgets/add_symptom_dialog.dart';

import 'symptom_tracker_page_test.mocks.dart';
// import 'symptom_tracker_notifier_test.mocks.dart'; // We can reuse mocks - REMOVED to avoid name collision
import 'package:firebase_auth/firebase_auth.dart' as firebase;

// Mock User class from Firebase Auth
class MockUser extends Mock implements firebase.User {
  @override
  final String uid = 'test_uid';
  @override
  final String displayName = 'Test User';
}

@GenerateNiceMocks([MockSpec<SymptomRepository>(), MockSpec<AuthRepository>()])
void main() {
  late MockSymptomRepository mockSymptomRepository;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockSymptomRepository = MockSymptomRepository();
    mockAuthRepository = MockAuthRepository();

    // Stub the auth repository to always provide a logged-in user for these tests
    when(
      mockAuthRepository.authStateChanges,
    ).thenAnswer((_) => Stream.value(MockUser()));
  });

  Widget createTestWidget(Stream<List<SymptomLog>> symptomStream) {
    // Stub the symptom repository to return the desired stream for the test
    when(
      mockSymptomRepository.watchAllSymptomLogs(any),
    ).thenAnswer((_) => symptomStream);

    return ProviderScope(
      overrides: [
        symptomRepositoryProvider.overrideWithValue(mockSymptomRepository),
        authRepositoryProvider.overrideWithValue(mockAuthRepository),
      ],
      child: const MaterialApp(home: SymptomTrackerPage()),
    );
  }

  group('SymptomTrackerPage Widget Tests', () {
    testWidgets('shows loading indicator initially', (tester) async {
      // For loading, we use a stream that never emits, so it stays in the loading state.
      await tester.pumpWidget(createTestWidget(const Stream.empty()));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows empty message when data is empty', (tester) async {
      await tester.pumpWidget(createTestWidget(Stream.value([])));
      await tester.pump(); // Pump to process the stream value
      expect(find.text('目前沒有任何症狀紀錄。\n點擊右下角按鈕新增第一筆紀錄。'), findsOneWidget);
    });

    testWidgets('shows a list of symptoms when data is available', (
      tester,
    ) async {
      final symptoms = [
        SymptomLog(
          id: 1,
          symptomName: 'Headache',
          severity: 5,
          recordedAt: DateTime.now(),
          userId: '1',
        ),
        SymptomLog(
          id: 2,
          symptomName: 'Fatigue',
          severity: 8,
          recordedAt: DateTime.now(),
          userId: '1',
        ),
      ];
      await tester.pumpWidget(createTestWidget(Stream.value(symptoms)));
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Headache'), findsOneWidget);
      expect(find.text('Fatigue'), findsOneWidget);
    });

    testWidgets('shows error message when stream has error', (tester) async {
      await tester.pumpWidget(createTestWidget(Stream.error('Test Error')));
      await tester.pump();
      expect(find.text('發生錯誤: Test Error'), findsOneWidget);
    });

    testWidgets('tapping FAB opens AddSymptomDialog', (tester) async {
      await tester.pumpWidget(createTestWidget(Stream.value([])));
      await tester.pump();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(AddSymptomDialog), findsOneWidget);
    });
  });
}
