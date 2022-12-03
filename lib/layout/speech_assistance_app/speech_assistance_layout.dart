import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/modules/home/home_screen.dart';
import 'package:speech_assistance_app/shared/providers/pressed_provider.dart';

class SpeechAssistanceLayout extends StatelessWidget {
  const SpeechAssistanceLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //double _height = MediaQuery.of(context).size.height / 6;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => Pressed(),
        child: const HomeScreen(),
      ),
    );
  }
}
