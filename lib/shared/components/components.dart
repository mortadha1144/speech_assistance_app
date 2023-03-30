import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/models/cell_model.dart';
import 'package:speech_assistance_app/models/cells_record.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/functions/functions.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/shared/styles/colors.dart';

class FolderCustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path0 = Path();

    path0.moveTo(0, size.height * 0.0451500);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.quadraticBezierTo(size.width, size.height * 0.3463750, size.width,
        size.height * 0.1268250);
    path0.cubicTo(
        size.width * 1.0032000,
        size.height * 0.0950250,
        size.width * 0.9615667,
        size.height * 0.0479250,
        size.width * 0.9035333,
        size.height * 0.0451750);
    path0.quadraticBezierTo(size.width * 0.7771667, size.height * 0.0451500,
        size.width * 0.3793333, size.height * 0.0451500);
    path0.lineTo(size.width * 0.3342000, 0);
    path0.lineTo(size.width * 0.0555667, 0);
    path0.lineTo(0, size.height * 0.0451500);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TriangleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path0 = Path();

    path0.moveTo(0, 0);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width, size.height * 0.1514750);
    path0.lineTo(size.width * 0.8320000, 0);
    path0.lineTo(0, 0);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class FolderCustomBorder extends CustomPainter {
  final Color borderColor;

  FolderCustomBorder({required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0451500);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.quadraticBezierTo(size.width, size.height * 0.3463750, size.width,
        size.height * 0.1268250);
    path0.cubicTo(
        size.width * 1.0032000,
        size.height * 0.0950250,
        size.width * 0.9615667,
        size.height * 0.0479250,
        size.width * 0.9035333,
        size.height * 0.0451750);
    path0.quadraticBezierTo(size.width * 0.7771667, size.height * 0.0451500,
        size.width * 0.3793333, size.height * 0.0451500);
    path0.lineTo(size.width * 0.3342000, 0);
    path0.lineTo(size.width * 0.0555667, 0);
    path0.lineTo(0, size.height * 0.0451500);
    path0.close();

    canvas.drawPath(path0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CellContent extends StatelessWidget {
  const CellContent({
    Key? key,
    this.text,
    this.imagePath,
    this.type,
  }) : super(key: key);

  final String? text;
  final String? imagePath;
  final int? type;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: type == 7 || type == 8 ? 1 : 0,
          child: const SizedBox(),
        ),
        Expanded(
          flex: 6,
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                type == 0 ? 'المزيد' : text ?? '',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 18,
          child: type == 0
              ? const FittedBox(
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.black,
                  ),
                )
              : imagePath == null
                  ? const SizedBox()
                  : Image.asset(
                      imagePath!,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
        ),
      ],
    );
  }
}

class FolderCell extends StatelessWidget {
  const FolderCell({
    Key? key,
    this.text,
    this.imagePath,
    required this.type,
    this.onPressed,
  }) : super(key: key);

  final String? text;
  final String? imagePath;
  final int type;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Color borderColor = const Color(0xFF000000);
    if (type == 8) {
      borderColor = Colors.red;
    }
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(4),
      // style: TextButton.styleFrom(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 4,
      //     vertical: 4,
      //   ),
      // ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(7),
          bottomRight: Radius.circular(7),
        ),
        child: ClipPath(
          clipper: FolderCustomClip(),
          child: CustomPaint(
            foregroundPainter: FolderCustomBorder(borderColor: borderColor),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: borderColor,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
                child: CellContent(
                  text: text,
                  imagePath: imagePath,
                  type: type,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TriangleCell extends StatelessWidget {
  const TriangleCell({
    Key? key,
    this.text,
    this.imagePath,
    required this.type,
    this.onPressed,
  }) : super(key: key);

  final String? text;
  final String? imagePath;
  final int type;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Color borderColor = orangeBorder;
    Color contentColor = orangeContent;
    if (type == 2) {
      borderColor = pinkBorder;
      contentColor = pinkContent;
    }
    if (type == 6) {
      borderColor = blueBorder;
      contentColor = blueContent;
    }
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(4),
      // style: TextButton.styleFrom(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 4,
      //     vertical: 4,
      //   ),
      // ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          color: borderColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: ClipPath(
            clipper: TriangleClip(),
            child: Container(
              color: contentColor,
              child: CellContent(
                text: text,
                imagePath: imagePath,
                type: type,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NormalCell extends StatelessWidget {
  const NormalCell({
    Key? key,
    this.text,
    this.imagePath,
    required this.type,
    this.onPressed,
  }) : super(key: key);

  final String? text;
  final String? imagePath;
  final int type;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Color borderColor = const Color(0xFF000000);
    Color contentColor = Colors.white;
    if (type == 4) {
      borderColor = blueBorder;
      contentColor = blueContent;
    } else if (type == 5) {
      borderColor = greenBorder;
      contentColor = greenContent;
    }
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(4),
      // style: TextButton.styleFrom(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 4,
      //     vertical: 4,
      //   ),
      // ),
      child: Container(
        decoration: BoxDecoration(
          color: contentColor,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CellContent(
            text: text,
            imagePath: imagePath,
            type: type,
          ),
        ),
      ),
    );
  }
}

class PressedCell extends StatelessWidget {
  const PressedCell({
    Key? key,
    required this.text,
    required this.imagePath,
    this.width,
  }) : super(key: key);

  final String text;
  final String imagePath;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(imagePath),
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
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
          onPressed: () =>
              context.read<HomeProvider>().onPressedDefault(findCell),
        );
      } else if (findCell.type == 1 ||
          findCell.type == 2 ||
          findCell.type == 6) {
        return TriangleCell(
          text: findCell.name,
          imagePath: findCell.image,
          type: findCell.type,
          onPressed: () =>
              context.read<HomeProvider>().onPressedDefault(findCell),
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

class CellsPage extends StatelessWidget {
  const CellsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
        ),
        Expanded(
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
    );
  }
}

class TextButtonForTapBar extends StatelessWidget {
  const TextButtonForTapBar({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon == null
              ? const SizedBox()
              : Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
        ],
      ),
    );
  }
}

class PressedText extends StatelessWidget {
  const PressedText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        //textAlign: TextAlign.start,
      ),
    );
  }
}

class CellTile extends StatelessWidget {
  const CellTile({
    Key? key,
    required this.cellsRecord,
    this.onTap,
    this.onLongPress,
    this.showOptions = false,
    this.selected = false,
    this.checkBoxOnChanged,
  }) : super(key: key);
  final CellModel cellsRecord;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool showOptions;
  final bool selected;
  final void Function(bool?)? checkBoxOnChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 8),
      child: SizedBox(
        height: 60,
        child: ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          selected: selected,
          selectedTileColor: const Color.fromARGB(255, 221, 221, 245),
          selectedColor: Colors.black,
          leading: CircleAvatar(
            backgroundColor: selected ? Colors.blue : Colors.pink[100],
            child: selected
                ? const Icon(
                    Icons.done,
                    color: Colors.white,
                  )
                : Text(cellsRecord.text[0]),
          ),
          onTap: onTap,
          onLongPress: onLongPress,
          title: cellsRecord.isCell?CellsType(
                  str: cellsRecord.text,
                  isReverse: false,
                )
              : Text(
                  cellsRecord.text,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )
              ,
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Functions.getCustomDates(cellsRecord.date),
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 12),
              ),
              cellsRecord.isPinned == 1
                  ? const Icon(Icons.push_pin_outlined)
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}

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
