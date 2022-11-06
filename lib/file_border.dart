import 'package:flutter/material.dart';
import 'package:speech_assistance_app/cell_class.dart';
import 'package:speech_assistance_app/path_builder_border.dart';

//import 'cell_class.dart';

class CellFileBorder extends StatelessWidget {
  const CellFileBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 500,
        width: 350,
        child: CustomPaint(
          painter: FileCustomBorder(),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(cells[0].name),
              Image.asset(
                cells[0].image,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
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

class FileCustomBorder extends CustomPainter {
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
    // TODO: implement shouldRepaint
    return true;
  }
}
