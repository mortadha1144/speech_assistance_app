import 'package:flutter/material.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

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
              height: 130,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
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
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                //color: Colors.white,
                child: LayoutBuilder(
                  builder: (p0, p1) {
                    double height = p1.maxHeight / 6;
                    return Table(
                    children: [
                      TableRow(children: [
                        SizedBox(
                          height: height,
                          child: defaultCell(
                            text: cells[0].name,
                            imagePath: cells[0].image,
                          ),
                        ),

                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.black),
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // ),
                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //     color: Colors.red,
                        //   ),
                        // ),
                      ]),
                      TableRow(children: [
                        SizedBox(
                          height: height,
                          child: defaultCell(
                            text: cells[0].name,
                            imagePath: cells[0].image,
                          ),
                        ),

                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.black),
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // ),
                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //     color: Colors.red,
                        //   ),
                        // ),
                      ]),
                      TableRow(children: [
                        SizedBox(
                          height: height,
                          child: defaultCell(
                            text: cells[0].name,
                            imagePath: cells[0].image,
                          ),
                        ),

                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.black),
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // ),
                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //     color: Colors.red,
                        //   ),
                        // ),
                      ]),
                      TableRow(children: [
                        SizedBox(
                          height: height,
                          child: defaultCell(
                            text: cells[0].name,
                            imagePath: cells[0].image,
                          ),
                        ),

                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.black),
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // ),
                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //     color: Colors.red,
                        //   ),
                        // ),
                      ]),
                      TableRow(children: [
                        SizedBox(
                          height: height,
                          child: defaultCell(
                            text: cells[0].name,
                            imagePath: cells[0].image,
                          ),
                        ),

                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.black),
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // ),
                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //     color: Colors.red,
                        //   ),
                        // ),
                      ]),
                      TableRow(children: [
                        SizedBox(
                          height: height,
                          child: defaultCell(
                            text: cells[0].name,
                            imagePath: cells[0].image,
                          ),
                        ),

                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.black),
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // ),
                        // TableCell(
                        //   child: Container(
                        //     width: 50,
                        //     height: 50,
                        //     color: Colors.red,
                        //   ),
                        // ),
                      ]),
                      // TableRow(children: [
                      //   TableCell(
                      //     child: Container(
                      //       width: 50,
                      //       height: 50,
                      //       color: Colors.red,
                      //     ),
                      //   ),
                      //   TableCell(
                      //     child: Container(
                      //       width: 50,
                      //       height: 50,
                      //       color: Colors.red,
                      //     ),
                      //   ),
                      // ]),
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
