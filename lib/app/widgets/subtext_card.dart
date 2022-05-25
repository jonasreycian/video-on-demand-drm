import 'package:flutter/material.dart';

class Subtext extends StatelessWidget {
  const Subtext({
    Key? key,
    required this.text,
    this.maxLines,
    this.color,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
    ),
  }) : super(key: key);

  final String text;
  final int? maxLines;
  final Color? color;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: textStyle,
    );
  }
}
