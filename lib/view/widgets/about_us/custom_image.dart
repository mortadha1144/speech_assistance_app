import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.isAboutUs,
    required this.image,
  });

  final bool isAboutUs;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (isAboutUs ? .58 : .8),
      child: AspectRatio(
        aspectRatio: (isAboutUs ? 1 : 2 / 1.5),
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}