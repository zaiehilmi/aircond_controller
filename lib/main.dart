import 'package:flutter/material.dart';

import 'ui/screen/remote_control.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RemoteControl(),
      debugShowCheckedModeBanner: false,
    );
  }
}
