import 'package:aq_prime/data/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopTenSection extends StatelessWidget {
  const TopTenSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Top 10',
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
          height: 150,
          color: Colors.transparent,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 150,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(seconds: 5),
              pageSnapping: true,
            ),
            itemCount: trending.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(trending[index].imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: 280,
                margin: const EdgeInsets.only(right: 20),
              );
            },
          ),
        ),
      ],
    );
  }
}
