import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/onboarding_provider.dart';
import 'package:speech_assistance_app/view/widgets/onboarding/custom_button.dart';
import 'package:speech_assistance_app/view/widgets/onboarding/custom_slider.dart';
import 'package:speech_assistance_app/view/widgets/onboarding/dots_controller.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late OnBoardingProvider provider;
  @override
  void initState() {
    super.initState();
    provider = Provider.of<OnBoardingProvider>(context, listen: false);
    provider.onInit();
  }

  @override
  void dispose() {
    provider.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    DotsControllerOnBoarding(),
                    Spacer(
                      flex: 2,
                    ),
                    CustomButtonOnBoarding()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
