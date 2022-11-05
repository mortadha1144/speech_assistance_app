import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_assistance_app/cell_class.dart';

class MyCell extends StatelessWidget {
  const MyCell({required this.height,super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffFE750D), width: 4)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
              color: const Color(0xfffef2e3),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                cells[0].name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Image.asset(
                cells[0].image,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
