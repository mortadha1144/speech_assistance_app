import 'package:flutter/material.dart';

class MyTest extends StatefulWidget {
  const MyTest({Key? key}) : super(key: key);

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  String myText = 'First String';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My AppBar'),
      ),
      body: Column(
        children: [
          Text(myText),
          ElevatedButton(
            onPressed: () {
              setState(() {
                myText='Another Text';
              });
            },
            child: const Text('Change Text'),
          )
        ],
      ),
    );
  }
}
