import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';

class FirebaseInitializer {
  static final FirebaseInitializer _instance = FirebaseInitializer._internal();
  factory FirebaseInitializer() => _instance;

  FirebaseInitializer._internal();

  Completer<FirebaseApp>? _completer;

  Future<FirebaseApp> initialize() async {
    if (_completer != null) {
      return _completer!.future;
    }

    _completer = Completer<FirebaseApp>();

    try {
      final app = Firebase.app();
      _completer!.complete(app);
    } on FirebaseException catch (_) {
      // Firebase.app() throws if no app is initialized, so initialize here
      try {
        final app = await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        _completer!.complete(app);
      } catch (e) {
        _completer!.completeError(e);
      }
    }

    return _completer!.future;
  }
}
