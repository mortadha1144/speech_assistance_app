import 'package:flutter/material.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class DetailesScreen extends StatelessWidget {
  const DetailesScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.content,
      this.type});

  final String image;
  final String title;
  final String content;
  final Enum? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7DC2FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            image,
            scale: type == DetailesScreenType.aboutApp ? null : 1.8,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              content,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
            ),
          ),
          type == DetailesScreenType.aboutApp
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Image.asset('images/resources/person.png'),
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Column(
                        textDirection: TextDirection.rtl,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            aboutAppContactTitle,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            aboutAppContactDetaile,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            aboutAppContactEmail,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
