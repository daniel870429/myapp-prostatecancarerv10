import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:myapp/domain/entities/symptom_log.dart';
import 'package:myapp/domain/repositories/symptom_repository.dart';
import 'package:myapp/domain/repositories/auth_repository.dart';
import 'package:myapp/data/data_providers.dart';
import 'package:myapp/presentation/features/symptom_tracker/notifiers/symptom_tracker_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart'
    as firebase; // Using as to avoid name clashes

import 'symptom_tracker_notifier_test.mocks.dart';

// Mock User class from Firebase Auth
class MockUser extends Mock implements firebase.User {
  @override
  final String uid = 'test_uid';
  @override
  final String displayName = 'Test User';
}

@GenerateNiceMocks([
  MockSpec<SymptomRepository>(),
  MockSpec<AuthRepository>(), // Also mock the AuthRepository
])
void main() {
  group('SymptomTrackerNotifier', () {
    late MockSymptomRepository mockSymptomRepository;
    late MockAuthRepository mockAuthRepository; // Add mock for AuthRepository
    late ProviderContainer container;
    final mockUser = MockUser();

    setUp(() {
      mockSymptomRepository = MockSymptomRepository();
      mockAuthRepository = MockAuthRepository(); // Instantiate the mock

      // Stub the auth repository to emit a mock user
      when(
        mockAuthRepository.authStateChanges,
      ).thenAnswer((_) => Stream.value(mockUser));

      container = ProviderContainer(
        overrides: [
          symptomRepositoryProvider.overrideWithValue(mockSymptomRepository),
          // Override the auth repository provider, which the real AuthNotifier will use
          authRepositoryProvider.overrideWithValue(mockAuthRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('addSymptom calls repository with correct data', () async {
      // Arrange
      const symptomName = 'Headache';
      const severity = 7;
      const notes = 'Felt very sharp.';

      // Act
      await container
          .read(symptomTrackerNotifierProvider.notifier)
          .addSymptom(symptomName, severity, notes);

      // Assert
      // Verify that addSymptomLog was called on the repository.
      // We use argThat to capture and inspect the argument.
      final captured =
          verify(
                mockSymptomRepository.addSymptomLog(argThat(isA<SymptomLog>())),
              ).captured.single
              as SymptomLog;

      expect(captured.symptomName, symptomName);
      expect(captured.severity, severity);
      expect(captured.notes, notes);
      expect(captured.userId, 'test_uid');
    });

    test('deleteSymptom calls repository with correct id', () async {
      // Arrange
      const symptomId = 123;

      // Act
      await container
          .read(symptomTrackerNotifierProvider.notifier)
          .deleteSymptom(symptomId);

      // Assert
      verify(
        mockSymptomRepository.deleteSymptomLog(symptomId, 'test_uid'),
      ).called(1);
    });
  });
}
