import 'package:flutter/material.dart';
import 'package:speech_assistance_app/view/widgets/settings/about_us.dart';
import 'package:speech_assistance_app/view/widgets/settings/custom_list_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/resources/settings.png',
            scale: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                CustomListTile(
                  title: 'نطق صوت الرموز',
                  leading: const Icon(Icons.volume_down_outlined),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                CustomListTile(
                  title: 'من نحن ؟',
                  leading: const Icon(Icons.groups_outlined),
                  trailing: const Icon(Icons.chevron_right_outlined),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ));
                  },
                ),
                const CustomListTile(
                  title: 'عن التطبيق',
                  leading: Icon(Icons.info_outline),
                  trailing: Icon(Icons.chevron_right_outlined),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
