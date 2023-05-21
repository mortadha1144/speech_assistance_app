import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async {
            final Uri url =
                Uri.parse('https://www.facebook.com/Code4Iraq');
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          icon: const Icon(
            AntIcons.facebookOutlined,
            color: Colors.teal,
            size: 36,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            AntIcons.instagramOutlined,
            color: Colors.teal,
            size: 36,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.telegram,
            color: Colors.teal,
            size: 36,
          ),
        ),
      ],
    );
  }
}