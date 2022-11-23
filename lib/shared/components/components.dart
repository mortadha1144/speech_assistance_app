import 'package:flutter/material.dart';

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

    path0.moveTo(0,size.height*0.0505000);
    path0.cubicTo(0,size.height*0.7246375,0,size.height*0.7246375,0,size.height*0.9493500);
    path0.cubicTo(size.width*0.0006333,size.height*0.9770500,size.width*0.0279000,size.height*0.9982000,size.width*0.0676000,size.height);
    path0.cubicTo(size.width*0.2838000,size.height,size.width*0.7162000,size.height,size.width*0.9324000,size.height);
    path0.cubicTo(size.width*0.9786667,size.height*0.9989000,size.width*0.9980333,size.height*0.9781750,size.width,size.height*0.9508500);
    path0.quadraticBezierTo(size.width,size.height*0.7379625,size.width,size.height*0.1751000);
    path0.lineTo(size.width*0.8322667,0);
    path0.quadraticBezierTo(size.width*0.2745417,0,size.width*0.0660000,0);
    path0.cubicTo(size.width*0.0355000,size.height*0.0036250,size.width*0.0088333,size.height*0.0166250,0,size.height*0.0505000);
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
  required String text,
  required String imagePath,
}) =>
    ClipPath(
      clipper: FolderCustomClip(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 500,
        width: 350,
        child: CustomPaint(
          painter: FolderCustomBorder(),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(text),
              Image.asset(
                imagePath,
              )
            ],
          ),
        ),
      ),
    );

Widget defaultCell({
  required String text,
  required String imagePath,
  required double height,
}) =>
    SizedBox(
      height: height,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: const Color(0xffFE750D),
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Column(
            children: [
              Container(
                color: const Color(0xfffef2e3),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Image.asset(
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


Widget defaultCellTriangle({
  required String text,
  required String imagePath,
  required double height,
}) =>
    SizedBox(
      height: height,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Colors.red,
            width: 2,
          ),
          color: Colors.red
        ),
        child: ClipPath(
          clipper: TriangleClip(),
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
    );


