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
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemExtent: MediaQuery.of(context).size.width/7,
                    controller: context.watch<Pressed>().controller,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: context.watch<Pressed>().tapedCells.length,
                    itemBuilder: (context, index) => PressedCell(
                        text: context
                            .watch<Pressed>()
                            .tapedCells[index]
                            .name,
                        imagePath: context
                            .watch<Pressed>()
                            .tapedCells[index]
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
                              child: const MainCell(id: 1),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 2),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 3),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 4),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 5),
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
                              child: const MainCell(id: 6),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 7),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 8),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 9),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 10),
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
                              child: const MainCell(id: 11),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 12),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 13),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 14),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 15),
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
                              child: const MainCell(id: 16),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 17),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 18),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 19),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 20),
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
                              child: const MainCell(id: 21),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 22),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 23),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 24),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 25),
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
                              child: const MainCell(id: 26),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 27),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 28),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 29),
                            ),
                            SizedBox(
                              width: width,
                              child: const MainCell(id: 0),
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
}

class MainCell extends StatelessWidget {
  const MainCell({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
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
          onPressed: () => context.read<Pressed>().onPressedDefault(findCell),
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
