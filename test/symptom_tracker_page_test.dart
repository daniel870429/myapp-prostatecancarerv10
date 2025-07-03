import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/data/data_providers.dart';
import 'package:myapp/domain/entities/symptom_log.dart';
import 'package:myapp/presentation/features/symptom_tracker/notifiers/symptom_tracker_notifier.dart';
import 'package:myapp/presentation/features/symptom_tracker/pages/symptom_tracker_page.dart';
import 'symptom_tracker_page_test.mocks.dart';
import 'package:firebase_auth/firebase_auth.dart';

@GenerateMocks([SymptomTrackerNotifier, User])
void main() {
  late MockSymptomTrackerNotifier mockSymptomTrackerNotifier;
  late MockUser mockUser;

  setUp(() {
    mockSymptomTrackerNotifier = MockSymptomTrackerNotifier();
    mockUser = MockUser();
    when(mockUser.uid).thenReturn('test_user');
  });

  testWidgets('SymptomTrackerPage displays list of symptoms',
      (WidgetTester tester) async {
    // Arrange
    final symptomLogs = [
      SymptomLog(
        id: 1,
        name: 'Headache',
        severity: 5,
        timestamp: DateTime.now(),
        comments: 'no comments',
        userId: 'test_user',
      ),
      SymptomLog(
        id: 2,
        name: 'Fatigue',
        severity: 8,
        timestamp: DateTime.now(),
        comments: 'no comments',
        userId: 'test_user',
      ),
    ];
    when(mockSymptomTrackerNotifier.build())
        .thenAnswer((_) => Stream.value(symptomLogs));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          symptomTrackerNotifierProvider
              .overrideWith(() => mockSymptomTrackerNotifier),
          authStateChangesProvider
              .overrideWith((ref) => Stream.value(mockUser)),
        ],
        child: const MaterialApp(
          home: SymptomTrackerPage(),
        ),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Headache'), findsOneWidget);
    expect(find.text('Fatigue'), findsOneWidget);
  });
}
