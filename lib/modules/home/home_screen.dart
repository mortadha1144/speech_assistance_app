import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/providers/home_provider.dart';
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
                      flex: 5,
                      child: InkWell(
                        onTap:()=> context.read<HomeProvider>().speakList(),
                        child: AnimatedList(
                          controller: context.watch<HomeProvider>().scrollController,
                          key: context.read<HomeProvider>().key,
                          scrollDirection: Axis.horizontal,
                          initialItemCount: context.watch<HomeProvider>().lengthOfCellsList,
                          itemBuilder: (context, index, animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: PressedCell(
                                text: context
                                    .watch<HomeProvider>()
                                    .tapedCells[index]
                                    .name,
                                imagePath: context
                                    .watch<HomeProvider>()
                                    .tapedCells[index]
                                    .image,
                                width: MediaQuery.of(context).size.width/6,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          onPressed: () =>
                              context.read<HomeProvider>().onPressedBackspace(),
                          child: const Icon(
                            Icons.backspace_rounded,
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
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
            child: Container(
              color: Colors.grey[200],
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
          ),
        ],
      ),
    );
  }
}
