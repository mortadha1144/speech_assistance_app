import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/view/widgets/home/pressed_cell.dart';

class CustomAnimatedList extends StatefulWidget {
  const CustomAnimatedList({Key? key}) : super(key: key);

  @override
  State<CustomAnimatedList> createState() => _CustomAnimatedListState();
}

class _CustomAnimatedListState extends State<CustomAnimatedList> {
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: context.read<HomeProvider>().key,
      initialItemCount: context.watch<HomeProvider>().tapedCells.length,
      itemBuilder: (context, index, animation) {
        return PressedCell(
          text: context.watch<HomeProvider>().tapedCells[index].name,
          imagePath: context.watch<HomeProvider>().tapedCells[index].image,
        );
      },
    );
  }
}