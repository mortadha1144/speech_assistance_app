import 'package:flutter/material.dart';

class PressedCell extends StatelessWidget {
  const PressedCell({
    Key? key,
    required this.text,
    required this.imagePath,
    this.width,
  }) : super(key: key);

  final String text;
  final String imagePath;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(imagePath),
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}