import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/providers/pressed_provider.dart';
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
            child: Text(
              type == 0 ? 'المزيد' : text ?? '',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
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
                      fit: BoxFit.cover,
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
  }) : super(key: key);

  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          onPressed: () => context.read<Pressed>().onPressedDefault(findCell),
        );
      } else if (findCell.type == 1 ||
          findCell.type == 2 ||
          findCell.type == 6) {
        return TriangleCell(
          text: findCell.name,
          imagePath: findCell.image,
          type: findCell.type,
          onPressed: () {},
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
      key: context.read<Pressed>().key,
      initialItemCount: context.watch<Pressed>().tapedCells.length,
      itemBuilder: (context, index, animation) {
        return PressedCell(
          text: context.watch<Pressed>().tapedCells[index].name,
          imagePath: context.watch<Pressed>().tapedCells[index].image,
        );
      },
    );
  }
}
