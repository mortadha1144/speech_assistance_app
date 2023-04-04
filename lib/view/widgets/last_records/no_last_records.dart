import 'package:flutter/material.dart';

class NoLastRecord extends StatelessWidget {
  const NoLastRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.grey[200],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
          child: Text(
            'لا توجد عبارات مستخدمة في الوقت الحالي ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
