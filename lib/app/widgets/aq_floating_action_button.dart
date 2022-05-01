import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AqFloatingActionButton extends StatelessWidget {
  const AqFloatingActionButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 3,
      duration: const Duration(milliseconds: 1500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 100,
          child: SizedBox(
            height: 65,
            width: 65,
            child: FloatingActionButton(
              backgroundColor: Colors.grey[850],
              child: const Icon(Icons.cast, color: Colors.white),
              onPressed: onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
