import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/data/data_providers.dart';
import 'package:myapp/domain/entities/symptom_log.dart';
import 'package:myapp/domain/repositories/symptom_repository.dart';
import 'package:myapp/presentation/features/symptom_tracker/notifiers/symptom_tracker_notifier.dart';
import 'symptom_tracker_notifier_test.mocks.dart';
import 'package:firebase_auth/firebase_auth.dart';

@GenerateMocks([SymptomRepository, User])
void main() {
  late MockSymptomRepository mockSymptomRepository;
  late MockUser mockUser;
  late ProviderContainer container;

  setUp(() {
    mockSymptomRepository = MockSymptomRepository();
    mockUser = MockUser();
    when(mockUser.uid).thenReturn('test_user');

    container = ProviderContainer(
      overrides: [
        symptomRepositoryProvider.overrideWithValue(mockSymptomRepository),
        authStateChangesProvider.overrideWith((ref) => Stream.value(mockUser)),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('addSymptomLog adds a symptom log', () async {
    // Arrange
    final symptomLog = SymptomLog(
      id: 1,
      name: 'Headache',
      severity: 5,
      timestamp: DateTime.now(),
      comments: 'no comments',
      userId: 'test_user',
    );
    when(mockSymptomRepository.addSymptomLog(symptomLog))
        .thenAnswer((_) async => {});

    // Act
    await container.read(symptomTrackerNotifierProvider.notifier).addSymptomLog(
          name: 'Headache',
          severity: 5,
          timestamp: DateTime.now(),
          comments: 'no comments',
        );

    // Assert
    verify(mockSymptomRepository.addSymptomLog(any)).called(1);
  });

  test('deleteSymptomLog deletes a symptom log', () async {
    // Arrange
    when(mockSymptomRepository.deleteSymptomLog(1, 'test_user'))
        .thenAnswer((_) async => {});

    // Act
    await container
        .read(symptomTrackerNotifierProvider.notifier)
        .deleteSymptomLog(1);

    // Assert
    verify(mockSymptomRepository.deleteSymptomLog(1, 'test_user')).called(1);
  });
}
