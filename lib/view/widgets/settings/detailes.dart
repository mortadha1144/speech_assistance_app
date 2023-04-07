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
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(height: 246, width: 246, child: Image.asset(image)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              title,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
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
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Expanded(
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset('images/resources/person.png'),
                        Column(
                          children: const [
                            Text('text1'),
                            Text('text2'),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
