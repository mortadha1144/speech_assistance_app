import 'package:flutter/material.dart';
import 'package:speech_assistance_app/view/screens/home_screen.dart';
import 'package:speech_assistance_app/view/screens/last_records_screen.dart';
import 'package:speech_assistance_app/view/screens/settings_screen.dart';
import 'package:speech_assistance_app/view/screens/text_reader_screen.dart';

class LayoutProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<Widget> screens = [
    const HomeScreen(),
    const TextReader(),
    const LastRecordScreen(),
    const SettingScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.keyboard_alt_outlined,
        ),
        label: 'Type'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.history_outlined,
        ),
        label: 'Record'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings_outlined,
        ),
        label: 'Setting'),
  ];

  void changeBottomNav(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
