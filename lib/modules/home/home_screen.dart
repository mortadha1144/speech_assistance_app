import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/providers/pressed_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          PressedCell(text: 'أنا', imagePath: 'images/i.png',),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      iconSize: 40,
                      icon: const Icon(
                        Icons.backspace_rounded,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 20,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: LayoutBuilder(
                builder: (p0, p1) {
                  var height = p1.maxHeight / 6;
                  var width = p1.maxWidth / 5;

                  return Column(
                    children: [
                      SizedBox(
                        height: height,
                        child: Row(
                          children: [
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 1),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 2),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 3),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 4),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 5),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height,
                        child: Row(
                          children: [
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 6),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 7),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 8),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 9),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 10),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height,
                        child: Row(
                          children: [
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 11),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 12),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 13),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 14),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 15),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height,
                        child: Row(
                          children: [
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 16),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 17),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 18),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 19),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height,
                        child: Row(
                          children: [
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 21),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 22),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 23),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 24),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 25),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height,
                        child: Row(
                          children: [
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 26),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 27),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 28),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 29),
                            ),
                            SizedBox(
                              width: width,
                              child: cell(context: context, id: 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Cell buildCell(int id) =>
      cells[cells.indexWhere((element) => element.id == id)];

  Widget cell({required BuildContext context, required int id}) {
    int index = cells.indexWhere((element) => element.id == id);
    if (index >= 0) {
      Cell findCell = cells[index];
      if (findCell.type == 3 ||
          findCell.type == 4 ||
          findCell.type == 5 ||
          findCell.type == 9) {
        return defaultCell(
          text: findCell.name,
          imagePath: findCell.image,
          type: findCell.type,
          onPressed: () =>
              context.read<Pressed>().onPressedDefault(findCell.id),
        );
      } else if (findCell.type == 1 ||
          findCell.type == 2 ||
          findCell.type == 6) {
        return defaultCellTriangle(
          text: findCell.name,
          imagePath: findCell.image,
          type: findCell.type,
          onPressed: () {},
        );
      } else if (findCell.type == 7 || findCell.type == 8) {
        return defaultCellFolder(
          text: findCell.name,
          imagePath: findCell.image,
          type: findCell.type,
          onPressed: () {},
        );
      }
    } else if (id == 0) {
      return defaultCell(
        onPressed: () {},
        type: id,
      );
    }

    return const SizedBox();
  }

// Padding buildPadding(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//     child: SizedBox(
//       width: MediaQuery.of(context).size.width,
//       //color: Colors.white,
//       child: LayoutBuilder(
//         builder: (p0, p1) {
//           double height = p1.maxHeight / 6;
//           double width = p1.maxWidth / 5;
//           return Stack(
//             children: [
//               GridView.count(
//                 childAspectRatio: width / height,
//                 crossAxisCount: 5,
//                 children: List.generate(
//                   cells.length,
//                   (index) {
//                     int conditionalIndex = cells
//                         .indexWhere((element) => element.serial == index + 1);
//                     return mainCell(
//                       text: cells[conditionalIndex].name,
//                       imagePath: cells[conditionalIndex].image,
//                       type: cells[conditionalIndex].type,
//                       onTap: () {
//                         tapedCells.add(cells[conditionalIndex].serial);
//                         print(tapedCells);
//                       },
//                     )!;
//                   },
//                   growable: false,
//                 ),
//               ),
//               Positioned(
//                 right: 0,
//                 bottom: 0,
//                 child: mainCell(height: height, width: width, type: 9)!,
//               ),
//             ],
//           );
//         },
//       ),
//     ),
//   );
// }
}
