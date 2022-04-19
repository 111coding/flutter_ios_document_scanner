import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class FlutterIosDocumentScanner {
  static const MethodChannel _channel = MethodChannel('flutter_ios_document_scanner');

  static Future<bool?> scanDocument() async {
    if (!Platform.isIOS) return null;
    return await _channel.invokeMethod('scan_document');
  }
}
