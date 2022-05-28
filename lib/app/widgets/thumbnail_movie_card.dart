import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ThumbnailCard extends StatelessWidget {
  const ThumbnailCard({
    this.index = 0,
    required this.imageUrl,
    this.title,
    this.onTap,
    this.height = 160,
    this.width = 120,
    Key? key,
  }) : super(key: key);
  final int index;
  final String imageUrl;
  final String? title;
  final Function()? onTap;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 500),
        child: FadeInAnimation(
          child: SlideAnimation(
            horizontalOffset: 100,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox.fromSize(
                    size: Size(width, height),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        // height: height,
                        // fadeInCurve: Curves.easeInQuart,
                        // fadeOutCurve: Curves.easeInQuart,
                        // fadeOutDuration: const Duration(milliseconds: 1000),
                        // fadeInDuration: const Duration(milliseconds: 200),
                        // fit: BoxFit.cover,
                        // placeholderFit: BoxFit.contain,
                        // placeholderScale: 1,
                        // placeholder: 'assets/images/APP.png',
                        // image: imageUrl,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  (title == null || title!.isEmpty)
                      ? const SizedBox()
                      : Text(
                          title!,
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
    required this.imageUrl,
    required this.onTap,
    this.height = 150,
    this.width = 160,
    Key? key,
  }) : super(key: key);
  final int index;
  final String imageUrl;
  final Function()? onTap;
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
                width: width,
                margin: const EdgeInsets.only(
                    left: 10, right: 0, top: 0, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: height,
                      width: width != null ? (width! - 20) : 130,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
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
