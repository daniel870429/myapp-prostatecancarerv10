import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:myapp/domain/repositories/auth_repository.dart';
import 'package:myapp/data/repositories/auth_repository_impl.dart';
import 'package:myapp/presentation/features/auth/notifiers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_notifier_test.mocks.dart';

// Generate mocks for the AuthRepository
@GenerateNiceMocks([MockSpec<AuthRepository>()])
void main() {
  group('AuthNotifier', () {
    late MockAuthRepository mockAuthRepository;
    late ProviderContainer container;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      // Create a ProviderContainer for testing, overriding the authRepositoryProvider
      // to return our mock instance.
      container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(mockAuthRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('signOut calls repository signOut', () async {
      // Arrange
      // Stub the signOut method to complete successfully
      when(
        mockAuthRepository.signOut(),
      ).thenAnswer((_) async => Future.value());
      // Stub the authStateChanges stream
      when(
        mockAuthRepository.authStateChanges(),
      ).thenAnswer((_) => Stream.value(null));

      // Act
      // Read the notifier from the container and call the method
      await container.read(authNotifierProvider.notifier).signOut();

      // Assert
      // Verify that the signOut method on the repository was called once.
      verify(mockAuthRepository.signOut()).called(1);
    });
  });
}
