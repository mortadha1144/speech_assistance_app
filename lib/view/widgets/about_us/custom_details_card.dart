import 'package:flutter/material.dart';

class CustomDetailsCard extends StatelessWidget {
  const CustomDetailsCard({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Scrollbar(
                scrollbarOrientation: ScrollbarOrientation.left,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SingleChildScrollView(
                    child: Text(
                      content,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        //height: 1.8,
                      ),
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
