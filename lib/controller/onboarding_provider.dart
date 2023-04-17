import 'package:flutter/material.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/view/screens/layout.dart';

class OnBoardingProvider with ChangeNotifier {
  int currentPage = 0;
  late PageController pageController;
  late String buttonTitle;
  void goToNextPage(BuildContext context) {
    currentPage++;
    if (currentPage > onBordingList.length - 1) {
      print('page 3');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Directionality(
                textDirection: TextDirection.rtl,
                child: SpeechAssistanceLayout()),
          ));
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
      //notifyListeners();
    }
  }

  void onPageChanged(int value) {
    currentPage = value;
    if (value == onBordingList.length - 1) {
      buttonTitle = 'إبدأ';
    }else{
      buttonTitle = 'التالي';
    }
    notifyListeners();
  }

  void onInit() {
    pageController = PageController();
    buttonTitle = 'التالي';
  }
}
