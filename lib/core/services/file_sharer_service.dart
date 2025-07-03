import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class FileSharerService {
  Future<void> saveAndShare(
    String fileName,
    Uint8List data,
    String text, {
    Rect? sharePositionOrigin,
  }) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$fileName');
    await file.writeAsBytes(data);

    final params = ShareParams(
      files: [XFile(file.path)],
      text: text,
      sharePositionOrigin: sharePositionOrigin,
    );
    await SharePlus.instance.share(params);
  }
}
