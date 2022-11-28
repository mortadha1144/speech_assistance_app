import 'package:flutter/material.dart';
import 'package:speech_assistance_app/shared/styles/colors.dart';

class FolderCustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.moveTo(0, size.height * 0.0380000);
    path.quadraticBezierTo(
        0, size.height * 0.7292600, 0, size.height * 0.9596800);
    path.cubicTo(
        size.width * 0.0011143,
        size.height * 0.9769400,
        size.width * 0.0243714,
        size.height * 0.9983200,
        size.width * 0.0576286,
        size.height);
    path.cubicTo(size.width * 0.2852429, size.height, size.width * 0.7219571,
        size.height, size.width * 0.9434000, size.height);
    path.cubicTo(
        size.width * 0.9778571,
        size.height * 0.9987600,
        size.width * 0.9998286,
        size.height * 0.9811200,
        size.width,
        size.height * 0.9598800);
    path.cubicTo(size.width, size.height * 0.7398950, size.width,
        size.height * 0.3036000, size.width, size.height * 0.0799400);
    path.cubicTo(
        size.width * 0.9977143,
        size.height * 0.0607400,
        size.width * 0.9757429,
        size.height * 0.0422000,
        size.width * 0.9432857,
        size.height * 0.0402800);
    path.quadraticBezierTo(size.width * 0.8007643, size.height * 0.0402500,
        size.width * 0.3732000, size.height * 0.0401600);
    path.lineTo(size.width * 0.3289714, 0);
    path.lineTo(size.width * 0.0461714, 0);
    path.lineTo(0, size.height * 0.0380000);
    path.close();

    return path;
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
      ..strokeWidth = 15.0;

    Path path = Path();
    path.moveTo(0, size.height * 0.0380000);
    path.quadraticBezierTo(
        0, size.height * 0.7292600, 0, size.height * 0.9596800);
    path.cubicTo(
        size.width * 0.0011143,
        size.height * 0.9769400,
        size.width * 0.0243714,
        size.height * 0.9983200,
        size.width * 0.0576286,
        size.height);
    path.cubicTo(size.width * 0.2852429, size.height, size.width * 0.7219571,
        size.height, size.width * 0.9434000, size.height);
    path.cubicTo(
        size.width * 0.9778571,
        size.height * 0.9987600,
        size.width * 0.9998286,
        size.height * 0.9811200,
        size.width,
        size.height * 0.9598800);
    path.cubicTo(size.width, size.height * 0.7398950, size.width,
        size.height * 0.3036000, size.width, size.height * 0.0799400);
    path.cubicTo(
        size.width * 0.9977143,
        size.height * 0.0607400,
        size.width * 0.9757429,
        size.height * 0.0422000,
        size.width * 0.9432857,
        size.height * 0.0402800);
    path.quadraticBezierTo(size.width * 0.8007643, size.height * 0.0402500,
        size.width * 0.3732000, size.height * 0.0401600);
    path.lineTo(size.width * 0.3289714, 0);
    path.lineTo(size.width * 0.0461714, 0);
    path.lineTo(0, size.height * 0.0380000);
    path.close();

    canvas.drawPath(path, paint);
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
}) =>
    SizedBox(
      height: height,
      child: ClipPath(
        clipper: FolderCustomClip(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: CustomPaint(
            painter: FolderCustomBorder(),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  text ?? '',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  imagePath ?? 'images/no_image.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                )
              ],
            ),
          ),
        ),
      ),
    );

Widget defaultCell({
  String? text,
  String? imagePath,
  required double height,
  required double width,
  required int type,
}) {
  Color borderColor = const Color(0xFF000000);
  Color? contentColor;
  if (type == 4) {
    borderColor = blueBorder;
    contentColor = blueContent;
  }
  if (type == 5) {
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
                  : Image.asset(
                      imagePath ?? 'images/no_image.png',
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
                  child: Image.asset(
                    imagePath ?? 'images/no_image.png',
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
  required double width,
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
      width: width,
      type: type,
    );
  } else if (type == 7 || type == 8) {
    return defaultCellFolder(
      text: text,
      imagePath: imagePath,
      height: height,
    );
  }
  return null;
}
