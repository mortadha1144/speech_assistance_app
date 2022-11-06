import 'package:flutter/material.dart';
import 'package:speech_assistance_app/path_builder_border.dart';

//import 'cell_class.dart';

class CellFileBorder extends StatelessWidget {
  const CellFileBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('data');
  }

  ClipPath myClipPath() {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 4),
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 500,
        width: 350,
        child: const Center(
          child: Text('data'),
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

    path.moveTo(0, size.height * 0.0406800);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 1.0038286, size.height * 0.3091800,
        size.width * 0.9980857, size.height * 0.0744600);
    path.cubicTo(
        size.width * 0.9948857,
        size.height * 0.0565600,
        size.width * 0.9835714,
        size.height * 0.0413000,
        size.width * 0.9580857,
        size.height * 0.0399800);
    path.quadraticBezierTo(size.width * 0.8009429, size.height * 0.0394800,
        size.width * 0.3428571, size.height * 0.0380000);
    path.lineTo(size.width * 0.3126000, 0);
    path.lineTo(size.width * 0.0384286, 0);
    path.lineTo(0, size.height * 0.0406800);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
