import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 1500),
      child: FadeInAnimation(
        child: SlideAnimation(
          horizontalOffset: 100,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.search, size: 30),
          ),
        ),
      ),
    );
  }
}
