import 'package:flutter/material.dart';
import 'package:speech_assistance_app/view/widgets/about_us/about_us_body.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: const AboutUsBody(),
    );
  }
}


