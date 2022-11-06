import 'dart:ui' as ui;
import 'package:flutter/material.dart';

typedef PathBuilder = ui.Path Function(ui.Rect, double);

class PathBuilderBorder extends OutlinedBorder {
  const PathBuilderBorder({
    required this.pathBuilder,
    BorderSide side = BorderSide.none,
    this.phase = 0,
  }) : super(side: side);

  final PathBuilder pathBuilder;
  final double phase;

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is PathBuilderBorder && phase != a.phase) {
      return PathBuilderBorder(
        pathBuilder: pathBuilder,
        side: side == a.side ? side : BorderSide.lerp(a.side, side, t),
        phase: ui.lerpDouble(a.phase, phase, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ui.Path getInnerPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  ui.Path getOuterPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    return pathBuilder(rect, phase);
  }

  @override
  void paint(ui.Canvas canvas, ui.Rect rect,
      {ui.TextDirection? textDirection}) {
    if (side != BorderSide.none) {
      canvas.drawPath(pathBuilder(rect, phase), side.toPaint());
    }
  }

  @override
  ShapeBorder scale(double t) => this;

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return PathBuilderBorder(
      pathBuilder: pathBuilder,
      side: side ?? this.side,
      phase: phase,
    );
  }
}
