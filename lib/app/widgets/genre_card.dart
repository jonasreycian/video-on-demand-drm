import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    required this.isLast,
    required this.genreName,
    Key? key,
  }) : super(key: key);
  final bool isLast;
  final String genreName;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          horizontalOffset: 100,
          child: Container(
            width: 220,
            decoration: BoxDecoration(
              color: Color.fromRGBO(30, 31, 65, 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            margin: EdgeInsets.only(right: isLast ? 0 : 20, bottom: 0),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Text(
                genreName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
