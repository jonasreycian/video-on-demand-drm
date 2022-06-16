import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class TitleTextCard extends StatelessWidget {
  TitleTextCard({
    required this.name,
    this.fontSize = 21,
    this.fontWeight = FontWeight.w700,
    this.icon = const SizedBox(),
    Key? key,
  }) : super(key: key);
  final String name;
  final Widget icon;
  double fontSize;
  FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 1500),
      child: FadeInAnimation(
        child: Row(
          children: [
            icon,
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
