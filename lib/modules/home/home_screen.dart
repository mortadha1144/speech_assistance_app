import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/providers/pressed_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Cell> _tapedCells = [];

  onPressedDefault(Cell cell) {
    _tapedCells.add(cell);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemExtent: MediaQuery.of(context).size.width/7,
                    //controller: context.watch<Pressed>().controller,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _tapedCells.length,
                    itemBuilder: (context, index) => PressedCell(
                        text: _tapedCells[index]
                            .name,
                        imagePath: _tapedCells[index]
                            .image),
                  ),
                ),
                // IconButton(
                //   onPressed: () {},
                //   iconSize: 40,
                //   icon: const Icon(
                //     Icons.backspace_rounded,
                //   ),
                // ),
              ],
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
                              child: getCell(id: 1),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 2),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 3),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 4),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 5),
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
                              child: getCell(id: 6),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 7),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 8),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 9),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 10),
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
                              child: getCell(id: 11),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 12),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 13),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 14),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 15),
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
                              child: getCell(id: 16),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 17),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 18),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 19),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 20),
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
                              child: getCell(id: 21),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 22),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 23),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 24),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 25),
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
                              child: getCell(id: 26),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 27),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 28),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 29),
                            ),
                            SizedBox(
                              width: width,
                              child: getCell(id: 0),
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
  Widget getCell({required int id,}){
    int index = cells.indexWhere((element) => element.id == id);
    if (index >= 0) {
      Cell findCell = cells[index];
      if (findCell.type == 3 ||
          findCell.type == 4 ||
          findCell.type == 5 ||
          findCell.type == 9) {
        return NormalCell(
          text: findCell.name,
          imagePath: findCell.image,
          type: findCell.type,
          onPressed: () {
            setState(() {
              onPressedDefault(findCell);
            });
          },
        );
      } else if (findCell.type == 1 ||
          findCell.type == 2 ||
          findCell.type == 6) {
        return TriangleCell(
          text: findCell.name,
          imagePath: findCell.image,
          type: findCell.type,
          onPressed: () {},
        );
      } else if (findCell.type == 7 || findCell.type == 8) {
        return FolderCell(
          text: findCell.name,
          imagePath: findCell.image,
          type: findCell.type,
          onPressed: () {},
        );
      }
    } else if (id == 0) {
      return NormalCell(
        onPressed: () {},
        type: id,
      );
    }

    return const SizedBox();
  }
}

// class MainCell extends StatelessWidget {
//   const MainCell({
//     Key? key,
//     required this.id,
//   }) : super(key: key);
//
//   final int id;
//
//   @override
//   Widget build(BuildContext context) {
//     int index = cells.indexWhere((element) => element.id == id);
//     if (index >= 0) {
//       Cell findCell = cells[index];
//       if (findCell.type == 3 ||
//           findCell.type == 4 ||
//           findCell.type == 5 ||
//           findCell.type == 9) {
//         return NormalCell(
//           text: findCell.name,
//           imagePath: findCell.image,
//           type: findCell.type,
//           onPressed: () => context.read<Pressed>().onPressedDefault(findCell),
//         );
//       } else if (findCell.type == 1 ||
//           findCell.type == 2 ||
//           findCell.type == 6) {
//         return TriangleCell(
//           text: findCell.name,
//           imagePath: findCell.image,
//           type: findCell.type,
//           onPressed: () {},
//         );
//       } else if (findCell.type == 7 || findCell.type == 8) {
//         return FolderCell(
//           text: findCell.name,
//           imagePath: findCell.image,
//           type: findCell.type,
//           onPressed: () {},
//         );
//       }
//     } else if (id == 0) {
//       return NormalCell(
//         onPressed: () {},
//         type: id,
//       );
//     }
//
//     return const SizedBox();
//   }
// }
