import 'package:flutter/material.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/view/widgets/about_us/custom_backgroung.dart';
import 'package:speech_assistance_app/view/widgets/about_us/custom_details_card.dart';
import 'package:speech_assistance_app/view/widgets/about_us/social_media_links.dart';

import 'custom_image.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.isAboutUs,
    required this.facebookUrl,
    this.instaUrl,
    this.teleUrl,
  });

  final String image;
  final String title;
  final String content;
  final bool isAboutUs;
  final String facebookUrl;
  final String? instaUrl;
  final String? teleUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          const CustomBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomImage(
                  image: image,
                  isAboutUs: isAboutUs,
                ),
                SizedBox(
                  height: isAboutUs
                      ? MediaQuery.of(context).size.height * 0.015
                      : 0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (isAboutUs ? .35 : .3),
                  child: CustomDetailsCard(
                    title: title,
                    content: content,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isAboutUs
                        ? const Text(
                            'تابعنا على :',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          )
                        : const Column(
                            children: [
                              Text(
                                aboutAppContactTitle,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.teal,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                aboutAppContactDetaile,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                SocialMediaLinks(
                  facebookUrl: facebookUrl,
                  instaUrl: instaUrl,
                  teleUrl: teleUrl,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
