import 'package:flutter/material.dart';
import 'package:speech_assistance_app/layout/speech_assistance_app/speech_assistance_layout.dart';
//import 'package:speech_assistance_app/cell_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpeechAssistanceLayout(),
    );
  }
}
