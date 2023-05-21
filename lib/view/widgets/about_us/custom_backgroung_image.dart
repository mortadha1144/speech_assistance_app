import 'package:flutter/material.dart';

class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({
    super.key,
    required this.image,
    required this.isAboutUs,
  });
  final String image;
  final bool isAboutUs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .35,
      color: Colors.teal,
      alignment: Alignment.topCenter,
      padding: isAboutUs
          ? null
          : EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * (isAboutUs ? .58 : .8),
        child: AspectRatio(
          aspectRatio: (isAboutUs ? 1 : 2 / 1.5),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
