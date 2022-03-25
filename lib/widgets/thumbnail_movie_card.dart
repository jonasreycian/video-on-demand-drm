import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ThumbnailCard extends StatelessWidget {
  const ThumbnailCard({
    required this.title,
    required this.imageUrl,
    required this.onTap,
    required this.heroTag,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final Function()? onTap;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(milliseconds: 500),
        child: FadeInAnimation(
          child: SlideAnimation(
            horizontalOffset: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: heroTag,
                  transitionOnUserGestures: true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 150,
                    width: 100,
                    margin: const EdgeInsets.only(right: 20),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title.split(" ")[0], //first word
                  overflow: TextOverflow.fade,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
