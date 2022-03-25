import 'package:aq_prime/data/data.dart';
import 'package:aq_prime/screens/video_details_screen.dart';
import 'package:aq_prime/widgets/thumbnail_movie_card.dart';
import 'package:flutter/material.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Trending',
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
            itemCount: trending.length,
            itemBuilder: (context, index) {
              return ThumbnailCard(
                title: trending[index].name!,
                imageUrl: trending[index].imageUrl!,
                heroTag: 'trendingSection ${trending[index].name} $index',
                onTap: () => Navigator.of(context).pushNamed(VideoDetailsPage.routeName, arguments: {
                  'data': combine1()[index],
                  'heroTag': 'trendingSection ${trending[index].name} $index',
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}
