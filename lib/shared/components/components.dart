import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/styles/colors.dart';

class FolderCustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path0 = Path();

    path0.moveTo(0,size.height*0.0495000);
    path0.lineTo(0,size.height);
    path0.lineTo(size.width,size.height);
    path0.lineTo(size.width,size.height*0.0853250);
    path0.quadraticBezierTo(size.width*0.9952000,size.height*0.0578500,size.width*0.9564333,size.height*0.0506000);
    path0.quadraticBezierTo(size.width*0.8023417,size.height*0.0507312,size.width*0.3400667,size.height*0.0511250);
    path0.lineTo(size.width*0.2996000,0);
    path0.lineTo(size.width*0.0481333,0);
    path0.lineTo(0,size.height*0.0495000);
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
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path0 = Path();
    path0.moveTo(0,size.height*0.0495000);
    path0.lineTo(0,size.height);
    path0.lineTo(size.width,size.height);
    path0.lineTo(size.width,size.height*0.0853250);
    path0.quadraticBezierTo(size.width*0.9952000,size.height*0.0578500,size.width*0.9564333,size.height*0.0506000);
    path0.quadraticBezierTo(size.width*0.8023417,size.height*0.0507312,size.width*0.3400667,size.height*0.0511250);
    path0.lineTo(size.width*0.2996000,0);
    path0.lineTo(size.width*0.0481333,0);
    path0.lineTo(0,size.height*0.0495000);
    path0.close();

    canvas.drawPath(path0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Widget defaultCellFolder({
  String? text,
  String? imagePath,
  required double height,
  required int type,
}) {
  Color borderColor = const Color(0xFF000000);
  if (type == 8) {
    borderColor = Colors.red;
  }
  return SizedBox(
    height: height,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight:Radius.circular(7), ),
        child: ClipPath(
          clipper: FolderCustomClip(),
          child: CustomPaint(
            painter: FolderCustomBorder(),
            child: Container(
              margin: const EdgeInsets.all(1.2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      flex: 6,
                      child: Center(
                        child: Text(
                          text ?? '',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: imagePath == null
                          ? Container()
                          : Image.asset(
                            imagePath,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            ),
          ),
        ),
    ),
  );
}


Widget defaultCell({
  String? text,
  String? imagePath,
  required double height,
  required int type,
}) {
  Color borderColor = const Color(0xFF000000);
  Color? contentColor;
  if (type == 4) {
    borderColor = blueBorder;
    contentColor = blueContent;
  } else if (type == 5) {
    borderColor = greenBorder;
    contentColor = greenContent;
  }
  return SizedBox(
    height: height,
    child: Container(
      margin: const EdgeInsets.all(4.0),
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
        child: Column(
          children: [
            Container(
              //color: const Color(0xfffef2e3),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                type == 9 ? 'More' : text ?? '',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: type == 9
                  ? const SizedBox.expand(
                      child: FittedBox(
                        child: Icon(Icons.arrow_forward_sharp),
                      ),
                    )
                  : imagePath == null
                      ? Container()
                      : Image.asset(
                          imagePath,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget defaultCellTriangle({
  String? text,
  String? imagePath,
  required double height,
  required int type,
}) {
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
  return SizedBox(
    height: height,
    child: Container(
      margin: const EdgeInsets.all(4.0),
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
            child: Column(
              children: [
                Container(
                  //color: const Color(0xfffef2e3),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    text ?? '',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: imagePath == null
                      ? Container()
                      : Image.asset(
                          imagePath,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget? mainCell({
  String? text,
  String? imagePath,
  required double height,
  required int type,
}) {
  if (type == 1 || type == 2 || type == 6) {
    return defaultCellTriangle(
      text: text,
      imagePath: imagePath,
      height: height,
      type: type,
    );
  } else if (type == 3 || type == 4 || type == 5 || type == 9) {
    return defaultCell(
      text: text,
      imagePath: imagePath,
      height: height,
      type: type,
    );
  } else if (type == 7 || type == 8) {
    return defaultCellFolder(
      text: text,
      imagePath: imagePath,
      height: height,
      type: type,
    );
  }
  return null;
}

Widget verticalTable(List<Cell> list) => LayoutBuilder(
      builder: (p0, p1) {
        double height = p1.maxHeight / 6;
        return GridView.count(

          crossAxisCount: 5,
          children: List.generate(
            list.length,
            (index) {
              int conditionalIndex =
                  list.indexWhere((element) => element.serial == index + 1);
              return mainCell(
                text: list[conditionalIndex].name,
                imagePath: list[conditionalIndex].image,
                height: height,
                type: list[conditionalIndex].type,
              )!;
            },
            growable: false,
          ),
        );
      },
    );

Widget testCell() => LayoutBuilder(
      builder: (p0, p1) {
        double height = p1.maxHeight / 6;
        return mainCell(
          text: cells[20].name,
          imagePath: cells[20].image,
          height: height,
          type: cells[20].type,
        )!;
      },
    );
