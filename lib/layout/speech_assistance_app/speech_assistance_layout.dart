import 'package:flutter/material.dart';
import 'package:speech_assistance_app/modules/home/home_screen.dart';

class SpeechAssistanceLayout extends StatelessWidget {
  const SpeechAssistanceLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //double _height = MediaQuery.of(context).size.height / 6;
    return const Scaffold(
      body: HomeScreen(),
    );
  }
}


