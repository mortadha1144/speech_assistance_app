import 'package:flutter/material.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/view/widgets/about_us/custom_backgroung_image.dart';
import 'package:speech_assistance_app/view/widgets/about_us/custom_details_card.dart';
import 'package:speech_assistance_app/view/widgets/about_us/social_media_links.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.isAboutUs,
  });

  final String image;
  final String title;
  final String content;
  final bool isAboutUs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          CustomBackgroundImage(
            image: image,
            isAboutUs: isAboutUs,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .31),
            child: Column(
              children: [
                CustomDetailsCard(
                  title: title,
                  content: content,
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
                const SocialMediaLinks(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
