import 'package:aq_prime/data/data.dart';
import 'package:aq_prime/widgets/top_ten_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
            'Top 10 Films',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 180,
          color: Colors.transparent,
          child: AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return TopTenCard(
                  title: trending[index].name!,
                  imageUrl: trending[index].imageUrl!,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
