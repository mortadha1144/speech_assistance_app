import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_assistance_app/view/widgets/home/custom_nav_bar.dart';
import 'package:speech_assistance_app/view/widgets/home/custom_play_bar.dart';
import 'package:speech_assistance_app/view/widgets/home/home_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomPlayBar(
            scrollController: _scrollController,
          ),
          const CustomNavBar(),
           HomeGridView(scrollController: _scrollController,),
        ],
      ),
    );
  }
}
