import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_assistance_app/cell_class.dart';

class MyCell extends StatelessWidget {
  const MyCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffFE750D), width: 6)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
              color: const Color(0xfffef2e3),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                cells[0].name,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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
