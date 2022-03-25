import 'package:aq_prime/data/data.dart';
import 'package:aq_prime/widgets/top_ten_card.dart';
import 'package:flutter/material.dart';

class OnlyAQprimeSection extends StatelessWidget {
  const OnlyAQprimeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Only on AQ Prime',
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
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: combine1().length,
            itemBuilder: (context, index) {
              return TopTenCard(
                title: combine1()[index].name!,
                imageUrl: combine1()[index].imageUrl!,
              );
            },
          ),
        ),
      ],
    );
  }
}
