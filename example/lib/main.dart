import 'package:flutter/material.dart';

import 'package:flutter_ios_document_scanner/flutter_ios_document_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _scan() {
    FlutterIosDocumentScanner.scanDocument();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
              onPressed: _scan,
              child: const Text("Scan!"),
            ),
          ),
        ),
      ),
    );
  }
}
