import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoCardTop extends StatelessWidget {
  InfoCardTop({
    Key? key,
    required this.widget,
    this.color,
  }) : super(key: key);

  final Widget widget;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ??= Color.fromRGBO(209, 52, 53, 1),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 35,
      child: Center(
        child: widget,
      ),
    );
  }
}
