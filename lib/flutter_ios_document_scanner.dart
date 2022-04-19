import 'dart:async';

import 'package:flutter/services.dart';

class FlutterIosDocumentScanner {
  static const MethodChannel _channel = MethodChannel('flutter_ios_document_scanner');

  static Future<bool?> scanDocument() async {
    return await _channel.invokeMethod('scan_document');
  }
}
