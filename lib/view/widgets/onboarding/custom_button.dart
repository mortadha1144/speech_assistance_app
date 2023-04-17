import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/onboarding_provider.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context, provider, child) => Container(
        margin: const EdgeInsets.only(bottom: 30),
        height: 50,
        child: MaterialButton(
          minWidth: 280,
          //padding: const EdgeInsets.symmetric(horizontal: 100),
          onPressed: () {
            provider.goToNextPage(context);
          },
          textColor: Colors.white,
          color: Colors.teal,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(
            provider.buttonTitle,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
