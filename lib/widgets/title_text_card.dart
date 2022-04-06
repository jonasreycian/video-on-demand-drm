import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TitleTextCard extends StatelessWidget {
  const TitleTextCard({
    required this.name,
    Key? key,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 1500),
      child: FadeInAnimation(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: 21,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
