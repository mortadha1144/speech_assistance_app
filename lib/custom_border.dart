import 'package:flutter/material.dart';

class CustomBorder extends OutlinedBorder {
  const CustomBorder({super.side});
  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return CustomBorder(side: side??this.side);
  }

  @override
  EdgeInsetsGeometry get dimensions {
    switch (side.strokeAlign) {
      case StrokeAlign.inside:
        return EdgeInsets.all(side.width);
      case StrokeAlign.center:
        return EdgeInsets.all(side.width / 2);
      case StrokeAlign.outside:
        return EdgeInsets.zero;
    }
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getOuterPath
    throw UnimplementedError();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) => CustomBorder(side: side.scale(t));
}
