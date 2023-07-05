import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({
    super.key,
    this.facebookUrl,
    this.website,
    this.email,
  });

  final String? facebookUrl;
  final String? website;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        facebookUrl == null
            ? const SizedBox.shrink()
            : IconButton(
                onPressed: facebookUrl == null
                    ? () {}
                    : () => openUrlLink(facebookUrl!),
                icon: const Icon(
                  AntIcons.facebookOutlined,
                  color: Colors.teal,
                  size: 36,
                ),
              ),
        const SizedBox(
          width: 8,
        ),
        website == null
            ? const SizedBox.shrink()
            : IconButton(
                onPressed:
                    website == null ? () {} : () => openUrlLink(website!),
                icon: const Icon(
                  Icons.language,
                  color: Colors.teal,
                  size: 36,
                ),
              ),
        const SizedBox(
          width: 8,
        ),
        email == null
            ? const SizedBox.shrink()
            : IconButton(
                onPressed: email == null ? () {} : () => openEmailLink(email!),
                icon: const Icon(
                  Icons.email,
                  color: Colors.teal,
                  size: 36,
                ),
              ),
      ],
    );
  }

  Future<void> openUrlLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {}
  }

  Future<void> openEmailLink(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (!await launchUrl(emailLaunchUri)) {}
  }
}
