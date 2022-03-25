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
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.timer_outlined, size: 13),
                Text(
                  ' 104 min',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Row(
              children: [
                Icon(Icons.calendar_month, size: 13),
                Text(
                  ' • 2019',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
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
