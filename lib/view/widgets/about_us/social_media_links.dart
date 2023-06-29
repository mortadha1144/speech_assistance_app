import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({
    super.key,
    required this.facebookUrl,
    this.instaUrl,
    this.teleUrl,
  });

  final String facebookUrl;
  final String? instaUrl;
  final String? teleUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => openUrlLink(facebookUrl),
          icon: const Icon(
            AntIcons.facebookOutlined,
            color: Colors.teal,
            size: 36,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        instaUrl == null
            ? const SizedBox.shrink()
            : IconButton(
                onPressed:
                    instaUrl == null ? () {} : () => openUrlLink(instaUrl!),
                icon: const Icon(
                  AntIcons.instagramOutlined,
                  color: Colors.teal,
                  size: 36,
                ),
              ),
        const SizedBox(
          width: 8,
        ),
        teleUrl == null
            ? const SizedBox.shrink()
            : IconButton(
                onPressed:
                    teleUrl == null ? () {} : () => openUrlLink(teleUrl!),
                icon: const Icon(
                  Icons.telegram,
                  color: Colors.teal,
                  size: 36,
                ),
              ),
      ],
    );
  }

  void openUrlLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    }
  }
}
