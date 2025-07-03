import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Stream<User?> authStateChanges();
  Future<void> signInWithGoogle();
  Future<void> signOut();
  User? get currentUser;
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password);
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password);
}
