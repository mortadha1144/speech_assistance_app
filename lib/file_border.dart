import 'package:flutter/material.dart';

//import 'cell_class.dart';

class CellFileBorder extends StatelessWidget {
  const CellFileBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/file_border.png'),
        ),
      ),
      child: SizedBox.expand(),
    );
  }
}
