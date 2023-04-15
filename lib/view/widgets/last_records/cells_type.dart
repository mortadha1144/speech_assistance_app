import 'package:flutter/material.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class CellsType extends StatelessWidget {
  const CellsType({Key? key, required this.str, this.isReverse = true})
      : super(key: key);

  final String str;
  final bool isReverse;

  @override
  Widget build(BuildContext context) {
    final List<String> list = str.split(' ');
    return SizedBox(
      height: 70,
      child: ListView.builder(
        reverse: isReverse,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => Column(
          children: [
            Expanded(
              child: Image.asset(cells[cells
                      .indexWhere((element) => element.name == list[index])]
                  .image),
            ),
            Text(
              list[index],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
