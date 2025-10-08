// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dotted_border/dotted_border.dart';

class PersonalDottedBorder extends StatefulWidget {
  const PersonalDottedBorder({
    super.key,
    this.width,
    this.height,
    this.stroke,
    this.radius,
    this.padding,
    this.color,
    this.dashWidth,
    this.dashSpace,
  });

  final double? width;
  final double? height;
  final double? stroke;
  final double? radius;
  final double? padding;
  final Color? color;
  final double? dashWidth;
  final double? dashSpace;

  @override
  State<PersonalDottedBorder> createState() => _PersonalDottedBorderState();
}

class _PersonalDottedBorderState extends State<PersonalDottedBorder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 100.0,
      height: widget.height ?? 100.0,
      child: DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: [widget.dashWidth ?? 10.0, widget.dashSpace ?? 5.0],
        strokeWidth: widget.stroke ?? 2.0,
        radius: Radius.circular(widget.radius ?? 12.0),
        padding: EdgeInsets.all(widget.padding ?? 0.0),
        color: widget.color ?? Colors.black,

        child: Container(), // Don't remove this widget
      ),
    );
  }
}
