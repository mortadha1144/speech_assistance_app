import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/settings.png',
            scale: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  minLeadingWidth: 10,
                  leading: const Icon(
                    Icons.volume_down,
                  ),
                  title: const Text(
                    'نطق الكلمة',
                  ),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                  tileColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                const ListTile(
                  title: Text('عن التطبيق'),
                ),
                const ListTile(
                  title: Text('من نحن ؟'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
