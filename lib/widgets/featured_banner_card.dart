import 'package:flutter/material.dart';

class FeaturedBannerCard extends StatelessWidget {
  const FeaturedBannerCard({
    required this.imageUrl,
    required this.title,
    required this.runTime,
    required this.releaseYear,
    required this.heroTag,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String runTime;
  final String releaseYear;
  final String heroTag;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: heroTag,
            transitionOnUserGestures: true,
            child: Container(
              height: 380,
              width: 280,
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
    );
  }
}
