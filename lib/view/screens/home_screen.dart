import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_assistance_app/view/widgets/home/custom_nav_bar.dart';
import 'package:speech_assistance_app/view/widgets/home/custom_play_bar.dart';
import 'package:speech_assistance_app/view/widgets/home/home_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Column(
        children: const [
          CustomPlayBar(),
          CustomNavBar(),
          HomeGridView(),
        ],
      ),
    );
  }
}
