import 'package:aq_prime/widgets/info_card_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AppBarVideoDetails extends StatelessWidget {
  const AppBarVideoDetails({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final String rating;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 100,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InfoCardTop(
                  widget: Text(
                    rating,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoCardTop(
                      widget: Text(
                        'Add Watch List!',
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      color: Color.fromRGBO(30, 31, 65, 1),
                    ),
                    const SizedBox(width: 10),
                    InfoCardTop(
                      widget: Icon(Icons.bookmark_outline, color: Colors.white),
                      color: Color.fromRGBO(30, 31, 65, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
