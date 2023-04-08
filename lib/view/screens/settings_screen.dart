import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/view/widgets/settings/custom_list_tile.dart';
import 'package:speech_assistance_app/view/widgets/settings/detailes.dart';

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
                  trailing: ValueListenableBuilder<Box>(
                    valueListenable: Hive.box(settingBox).listenable(),
                    builder: (context, box, widget) => Switch(
                      value: box.get('enable_voice', defaultValue: true),
                      onChanged: (value) {
                        box.put('enable_voice', value);
                      },
                    ),
                  ),
                ),
                CustomListTile(
                  title: 'من نحن ؟',
                  leading: const Icon(Icons.groups_outlined),
                  trailing: const Icon(Icons.chevron_right_outlined),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DetailesScreen(
                          image: aboutUsImage,
                          title: aboutUsTitle,
                          content: aboutUsContent),
                    ));
                  },
                ),
                CustomListTile(
                  title: 'عن التطبيق',
                  leading: const Icon(Icons.info_outline),
                  trailing: const Icon(Icons.chevron_right_outlined),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DetailesScreen(
                          image: aboutAppImage,
                          title: aboutAppTitle,
                          content: aboutAppContent,
                          type: DetailesScreenType.aboutApp),
                    ));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
