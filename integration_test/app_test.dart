// integration_test/app_test.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/data/data_providers.dart';
import 'package:myapp/domain/entities/symptom_log.dart';
import 'package:myapp/domain/repositories/symptom_repository.dart';
import 'package:myapp/main.dart' as app;
import 'package:firebase_auth/firebase_auth.dart';

import '../test/auth_notifier_test.mocks.dart';

// Re-using mocks from unit tests is fine, but for integration tests,
// it's often clearer to define them here or in a dedicated file.
class MockSymptomRepository extends Mock implements SymptomRepository {}
class MockUser extends Mock implements User {
  @override
  String get uid => 'test_uid';
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    late MockAuthRepository mockAuthRepository;
    late MockSymptomRepository mockSymptomRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      mockSymptomRepository = MockSymptomRepository();
    });

    testWidgets('login, add, and verify a symptom', (tester) async {
      // Arrange:
      // 1. Mock the auth state to simulate a logged-in user.
      when(mockAuthRepository.authStateChanges).thenAnswer((_) => Stream.value(MockUser()));

      // 2. Mock the symptom repository to return an empty list initially.
      final symptomsController = StreamController<List<SymptomLog>>();
      when(mockSymptomRepository.watchAllSymptomLogs(any)).thenAnswer((_) => symptomsController.stream);

      // 3. Mock the addSymptomLog method to do nothing but succeed.
      when(mockSymptomRepository.addSymptomLog(any)).thenAnswer((_) async {});

      // Start the app with the mocked providers
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWithValue(mockAuthRepository),
            symptomRepositoryProvider.overrideWithValue(mockSymptomRepository),
          ],
          child: app.MyApp(),
        ),
      );

      // Act 1: Initial state
      // Push an empty list to the stream to simulate the initial state.
      symptomsController.add([]);
      await tester.pumpAndSettle();

      // Assert 1: Verify we are on the correct page and the list is empty.
      expect(find.text('Symptom Tracker'), findsOneWidget);
      expect(find.text('No symptoms logged yet.'), findsOneWidget);

      // Act 2: Add a new symptom
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.widgetWithText(TextFormField, 'Symptom Name'), 'Headache');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      
      // After adding, push the new list to the stream to simulate the update.
      final newSymptom = SymptomLog(id: 1, symptomName: 'Headache', severity: 5, recordedAt: DateTime.now(), userId: 'test_uid');
      symptomsController.add([newSymptom]);
      await tester.pumpAndSettle();

      // Assert 2: Verify the new symptom is now in the list.
      expect(find.text('Headache'), findsOneWidget);
      expect(find.text('Severity: 5'), findsOneWidget);
      expect(find.text('No symptoms logged yet.'), findsNothing);

      // Clean up the stream controller
      await symptomsController.close();
    });
  });
}
