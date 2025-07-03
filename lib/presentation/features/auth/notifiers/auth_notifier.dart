import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/data_providers.dart';
import '../../../../domain/repositories/auth_repository.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _authRepository;

  @override
  Future<void> build() async {
    _authRepository = ref.watch(authRepositoryProvider);
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _authRepository.signInWithGoogle());
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _authRepository.signOut());
  }
}
