import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class TitleTextCard extends StatelessWidget {
  TitleTextCard({
    required this.name,
    this.fontSize,
    this.fontWeight,
    this.icon,
    Key? key,
  }) : super(key: key);
  final String name;
  final String? icon;
  double? fontSize;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 1500),
      child: FadeInAnimation(
        child: Row(
          children: [
            ...icon != null
                ? [
                    Image.asset(
                      icon!,
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ]
                : [const SizedBox()],
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: fontWeight ?? FontWeight.w700,
                fontSize: fontSize ?? 21,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
