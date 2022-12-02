import 'package:flutter/cupertino.dart';
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

Widget defaultCellFolder({
  String? text,
  String? imagePath,
  required int type,
  required Function()? onPressed,
}) {
  Color borderColor = const Color(0xFF000000);
  if (type == 8) {
    borderColor = Colors.red;
  }
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
    ),
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
              child: contentColumn(
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

Column contentColumn({
  String? text,
  String? imagePath,
  int? type,
}) {
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
          child: Text(
            type == 0 ? 'المزيد' : text ?? '',
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
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
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
      ),
    ],
  );
}

Widget defaultCell({
  String? text,
  String? imagePath,
  int? type,
  required Function()? onPressed,
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
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
    ),
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
        child: contentColumn(
          text: text,
          imagePath: imagePath,
          type: type,
        ),
      ),
    ),
  );
}

Widget defaultCellTriangle({
  String? text,
  String? imagePath,
  required int type,
  required Function()? onPressed,
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
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
    ),
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
            child: contentColumn(
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

Widget? mainCell({
  String? text,
  String? imagePath,
  double? height,
  double? width,
  int? type,
  required Function()? onPressed,
}) {
  if (type == 3 || type == 4 || type == 5 || type == 9 || type == null) {
    return defaultCell(
      text: text,
      imagePath: imagePath,
      type: type,
      onPressed: onPressed,
    );
  } else if (type == 1 || type == 2 || type == 6) {
    return defaultCellTriangle(
      text: text,
      imagePath: imagePath,
      type: type,
      onPressed: onPressed,
    );
  } else if (type == 7 || type == 8) {
    return defaultCellFolder(
      text: text,
      imagePath: imagePath,
      type: type,
      onPressed: onPressed,
    );
  }
  return defaultCell(onPressed: () {});
}

Widget pressedCell({
  required String text,
  required String imagePath,
}) =>
    Column(
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
    );
