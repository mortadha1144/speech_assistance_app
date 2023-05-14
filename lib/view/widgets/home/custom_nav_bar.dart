import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/view/widgets/home/custom_nav_bar_icon.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        height: MediaQuery.of(context).size.height / 22,
        width: double.infinity,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomNavBarIcon(
                enable: provider.enableBack,
                icon: Icons.arrow_back,
                onPress: provider.backToFirstDisplayedItemList),
            Text(
              provider.navBarTitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const CustomNavBarIcon(enable: true, icon: Icons.delete),
          ],
        ),
      ),
    );
  }
}
