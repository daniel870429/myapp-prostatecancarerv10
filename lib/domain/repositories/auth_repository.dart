// lib/domain/repositories/auth_repository.dart

import 'package:firebase_auth/firebase_auth.dart';

/// Abstract interface for an authentication repository.
///
/// This defines the contract for data operations related to user authentication,
/// keeping it independent of the specific implementation (e.g., Firebase).
abstract class AuthRepository {
  /// A stream that emits the current authenticated [User] or null if not authenticated.
  Stream<User?> get authStateChanges;

  /// The currently authenticated user. Can be null.
  User? get currentUser;

  /// Signs in a user with the given email and password.
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Creates a new user account with the given email and password.
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user.
  Future<void> signOut();
}
