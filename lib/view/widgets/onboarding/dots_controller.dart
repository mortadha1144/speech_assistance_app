import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/onboarding_provider.dart';
import 'package:speech_assistance_app/models/data/static.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class DotsControllerOnBoarding extends StatelessWidget {
  const DotsControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context, provider, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBordingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    duration: const Duration(milliseconds: 500),
                    width: provider.currentPage == index ? 13 : 10,
                    height: provider.currentPage == index ? 13 : 10,
                    decoration: BoxDecoration(
                        color:
                            provider.currentPage == index ? Colors.teal : null,
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
