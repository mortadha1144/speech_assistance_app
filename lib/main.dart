import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/layout_provider.dart';
import 'package:speech_assistance_app/controller/onboarding_provider.dart';
import 'package:speech_assistance_app/controller/text_to_speech_provider.dart';
import 'package:speech_assistance_app/data/models/cell.dart';
import 'package:speech_assistance_app/data/models/cell_model.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/view/screens/layout.dart';
import 'package:speech_assistance_app/view/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(CellModelAdapter())
    ..registerAdapter(CellAdapter());
  await Hive.openBox<CellModel>(kCellsBox);
  await Hive.openBox(settingBox);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (_) => LayoutProvider()),
        ChangeNotifierProvider(create: (_) => LastRecordProvider()),
        ChangeNotifierProxyProvider<LastRecordProvider, HomeProvider>(
          create: (_) => HomeProvider(),
          update: (_, value, previous) => previous!..update(value),
        ),
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
    var box = Hive.box(settingBox);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Cairo'),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: box.get('onboarding_showed', defaultValue: false)
            ? const SpeechAssistanceLayout()
            : const OnBoarding(),
      ),
    );
  }
}
