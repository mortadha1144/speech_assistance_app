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

    path0.moveTo(0,size.height*0.0451500);
    path0.lineTo(0,size.height);
    path0.lineTo(size.width,size.height);
    path0.quadraticBezierTo(size.width,size.height*0.3463750,size.width,size.height*0.1268250);
    path0.cubicTo(size.width*1.0032000,size.height*0.0950250,size.width*0.9615667,size.height*0.0479250,size.width*0.9035333,size.height*0.0451750);
    path0.quadraticBezierTo(size.width*0.7771667,size.height*0.0451500,size.width*0.3793333,size.height*0.0451500);
    path0.lineTo(size.width*0.3342000,0);
    path0.lineTo(size.width*0.0555667,0);
    path0.lineTo(0,size.height*0.0451500);
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
    path0.moveTo(0,size.height*0.0451500);
    path0.lineTo(0,size.height);
    path0.lineTo(size.width,size.height);
    path0.quadraticBezierTo(size.width,size.height*0.3463750,size.width,size.height*0.1268250);
    path0.cubicTo(size.width*1.0032000,size.height*0.0950250,size.width*0.9615667,size.height*0.0479250,size.width*0.9035333,size.height*0.0451750);
    path0.quadraticBezierTo(size.width*0.7771667,size.height*0.0451500,size.width*0.3793333,size.height*0.0451500);
    path0.lineTo(size.width*0.3342000,0);
    path0.lineTo(size.width*0.0555667,0);
    path0.lineTo(0,size.height*0.0451500);
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
   double? height,
   double? width,
  required int type,
}) {
  Color borderColor = const Color(0xFF000000);
  if (type == 8) {
    borderColor = Colors.red;
  }
  return SizedBox(
    height: height,
    width: width,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
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
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        text ?? '',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
   double? height,
   double? width,
   int? type,
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
    width: width,
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
                type == 9 ? 'المزيد' : text ?? '',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: type == 9
                  ? const SizedBox.expand(
                      child: FittedBox(
                        child: Icon(Icons.arrow_forward_sharp),
                      ),
                    )
                  : imagePath == null || type == null
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
   double? height,
   double? width,
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
    width: width,
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
                        fontSize: 14, fontWeight: FontWeight.bold),
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
   double? height,
   double? width,
   int? type,
}) {
  if (type == 3 || type == 4 || type == 5 || type == 9 || type == null) {
    return defaultCell(
      text: text,
      imagePath: imagePath,
      height: height,
      width: width,
      type: type,
    );
  } else if (type == 1 || type == 2 || type == 6) {
    return defaultCellTriangle(
      text: text,
      imagePath: imagePath,
      height: height,
      width: width,
      type: type,
    );
  } else if (type == 7 || type == 8) {
    return defaultCellFolder(
      text: text,
      imagePath: imagePath,
      height: height,
      width: width,
      type: type,
    );
  }
  return defaultCell();
}
