import 'package:flutter/material.dart';
import 'package:speech_assistance_app/view/widgets/about_us/about_us_body.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.content, required this.isAboutUs});

  final String image;
  final String title;
  final String content;
  final bool isAboutUs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: AboutBody(
        image: image,
        title: title,
        content: content,
        isAboutUs: isAboutUs,
      ),
    );
  }
}
