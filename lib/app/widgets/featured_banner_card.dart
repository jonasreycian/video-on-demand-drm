import 'package:flutter/material.dart';

class FeaturedBannerCard extends StatelessWidget {
  const FeaturedBannerCard({
    required this.imageUrl,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 380,
            width: 280,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
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
                image: imageUrl,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
