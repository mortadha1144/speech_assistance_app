import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/layout_provider.dart';

class SpeechAssistanceLayout extends StatelessWidget {
  const SpeechAssistanceLayout({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutProvider watchProvider = context.watch<LayoutProvider>();
    LayoutProvider raedProvider = context.read<LayoutProvider>();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.grey,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: watchProvider.currentIndex,
        items: watchProvider.bottomItems,
        onTap: (value) => raedProvider.changeBottomNav(value),
      ),
      body: watchProvider.screens[watchProvider.currentIndex],
    );
  }
}
