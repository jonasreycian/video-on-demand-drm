import 'package:flutter/material.dart';

class FeaturedBannerCard extends StatelessWidget {
  const FeaturedBannerCard({
    required this.imageUrl,
    required this.title,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 380,
          width: 280,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
