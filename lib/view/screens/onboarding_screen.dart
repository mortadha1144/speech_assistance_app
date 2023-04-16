import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: onBordingList.length,
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  onBordingList[index].image,
                  width: 400,
                  height: 400,
                ),
              ),
              Text(
                onBordingList[index].title,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                onBordingList[index].content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
