import 'package:flutter/material.dart';

class Subtext extends StatelessWidget {
  const Subtext({
    Key? key,
    required this.text,
    this.maxLines,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  final String text;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: fontWeight ?? FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontSize: 15,
        color: color ?? Colors.white,
      ),
    );
  }
}
