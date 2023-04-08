import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/text_to_speech_provider.dart';
import 'package:speech_assistance_app/layout/speech_assistance_app/speech_assistance_layout.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';
import 'package:speech_assistance_app/models/cell_model.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CellModelAdapter());
  await Hive.openBox<CellModel>(kCellsBox);
  await Hive.openBox(settingBox);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => LastRecordProvider()),
        ChangeNotifierProxyProvider<LastRecordProvider, TextToSpeechProvider>(
          create: (_) => TextToSpeechProvider(),
          update: (_, value, previous) => previous!..update(value),
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
