library circle_gadget;

import 'package:circle_gadget/renders/circular_gadget_render_object.dart';
import 'package:flutter/material.dart';

class CircularGadgetWidget extends StatelessWidget {
  const CircularGadgetWidget({
    super.key,
    required this.width,
    required this.height,
    required this.min,
    required this.max,
    required this.value,
    required this.strokeWidth,
    required this.strokeColor,
    required this.strokeValueColor,
    required this.centerColor,
  });

  final double width, height;
  final double min, max, value;
  final double strokeWidth;
  final Color strokeColor;
  final Color strokeValueColor;
  final Color centerColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(width, height),
      child: CircularGadgetRenderObject(
        centerColor: centerColor,
        strokeColor: strokeColor,
        strokeValueColor: strokeValueColor,
        strokeWidth: strokeWidth,
        min: min,
        max: max,
        value: value,
        key: key,
      ),
    );
  }
}
