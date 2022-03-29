import 'package:aq_prime/widgets/movie_info_card_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MovieInfoCard extends StatelessWidget {
  MovieInfoCard({
    required this.type,
    required this.value,
    required this.iconData,
    this.isLast = false,
    Key? key,
  }) : super(key: key);
  final String type;
  final String value;
  final IconData iconData;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          horizontalOffset: 100,
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              color: Color.fromRGBO(30, 31, 65, 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            margin: EdgeInsets.only(right: isLast ? 0 : 20, bottom: 0),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(iconData, color: Colors.white, size: 45),
                InfoMovieCardText(type: type, value: value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
