import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/text_to_speech_provider.dart';
import 'package:speech_assistance_app/layout/speech_assistance_app/speech_assistance_layout.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(context)),
        ChangeNotifierProvider(create: (context) => LastRecordProvider()),
        ChangeNotifierProxyProvider<LastRecordProvider, TextToSpeechProvider>(
          create: (context) => TextToSpeechProvider(),
          update: (context, value, previous) => previous!..update(value),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: SpeechAssistanceLayout(),
      ),
    );
  }
}
