import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ThumbnailCard extends StatelessWidget {
  const ThumbnailCard({
    this.index,
    this.imageUrl,
    this.title,
    this.onTap,
    this.heroTag,
    Key? key,
  }) : super(key: key);
  final int? index;
  final String? imageUrl;
  final String? title;
  final Function()? onTap;
  final String? heroTag;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimationConfiguration.staggeredList(
        position: index ?? 0,
        duration: const Duration(milliseconds: 500),
        child: FadeInAnimation(
          child: SlideAnimation(
            horizontalOffset: 100,
            child: Container(
              color: Colors.transparent,
              width: 150,
              margin: const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage.assetNetwork(
                        height: 200,
                        fadeInCurve: Curves.easeInQuart,
                        fadeOutCurve: Curves.easeInQuart,
                        fadeOutDuration: const Duration(milliseconds: 1000),
                        fadeInDuration: const Duration(milliseconds: 200),
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.contain,
                        placeholderScale: 15,
                        placeholder: 'assets/images/loading1.gif',
                        image: imageUrl!,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    title ?? '--',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    softWrap: true,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThumbnailCardForGrid extends StatelessWidget {
  const ThumbnailCardForGrid({
    required this.index,
    // required this.title,
    required this.releaseYear,
    required this.runTime,
    required this.imageUrl,
    required this.onTap,
    required this.heroTag,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);
  final int index;
  final String imageUrl;
  final String runTime;
  final String releaseYear;
  final Function()? onTap;
  final String heroTag;
  final double? height;
  final double? width;
  final Duration duration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimationConfiguration.staggeredGrid(
        columnCount: 3,
        position: index,
        duration: duration,
        child: ScaleAnimation(
          duration: duration,
          child: FadeInAnimation(
            duration: duration,
            child: FlipAnimation(
              duration: duration,
              child: Container(
                color: Colors.transparent,
                // height: 200,
                width: width ?? 150,
                margin: const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: heroTag,
                      transitionOnUserGestures: true,
                      child: Container(
                        height: height ?? 160,
                        width: width != null ? (width! - 20) : 130,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
