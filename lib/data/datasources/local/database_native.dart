import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _secureStorage = FlutterSecureStorage();
const _dbKey = 'db_key';

Future<String> _getDatabaseKey() async {
  var key = await _secureStorage.read(key: _dbKey);
  if (key == null) {
    final random = Random.secure();
    key = base64Url.encode(List<int>.generate(32, (_) => random.nextInt(256)));
    await _secureStorage.write(key: _dbKey, value: key);
  }
  return key;
}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Await the key retrieval
    final key = await _getDatabaseKey();

    // This is not needed for `sqlcipher_flutter_libs`
    // if (Platform.isAndroid || Platform.isIOS) {
    // } else {
    //   final libraryNextToScript = File('sqlite3.so');
    //   if (libraryNextToScript.existsSync()) {
    //     sqlite3.open.overrideFor(OperatingSystem.linux,
    //         () => DynamicLibrary.open(libraryNextToScript.path));
    //   }
    // }

    final database = NativeDatabase(file, setup: (db) {
      db.execute("PRAGMA key = '$key';");
    });
    return database;
  });
}
