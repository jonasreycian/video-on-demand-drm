import 'package:aq_prime/data/data.dart';
import 'package:aq_prime/widgets/featured_banner_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Featured',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 415,
          color: Colors.transparent,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 450,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(seconds: 5),
              pageSnapping: true,
            ),
            itemCount: myList.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return FeaturedBannerCard(
                imageUrl: myList[index].imageUrl!,
                title: myList[index].name!,
              );
            },
          ),
        ),
      ],
    );
  }
}
