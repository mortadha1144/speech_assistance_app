import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/onboarding_provider.dart';
import 'package:speech_assistance_app/data/static/static.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context, provider, child) => PageView.builder(
        controller: provider.pageController,
        onPageChanged: provider.onPageChanged,
        itemCount: onBordingList.length,
        itemBuilder: (context, index) => Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              onBordingList[index].image,
              fit: index == 1 ? BoxFit.fill : BoxFit.contain,
              width: 400,
              height: 300,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              onBordingList[index].title,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  onBordingList[index].content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(height: 2, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
