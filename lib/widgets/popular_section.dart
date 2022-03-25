import 'package:aq_prime/data/data.dart';
import 'package:aq_prime/screens/video_details_screen.dart';
import 'package:aq_prime/widgets/thumbnail_movie_card.dart';
import 'package:flutter/material.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Popular',
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
            itemCount: combine().length,
            itemBuilder: (context, index) {
              return ThumbnailCard(
                title: combine()[index].name!,
                imageUrl: combine()[index].imageUrl!,
                heroTag: 'popularSection ${combine()[index].imageUrl} $index',
                onTap: () => Navigator.of(context).pushNamed(VideoDetailsPage.routeName, arguments: {
                  'data': combine()[index],
                  'heroTag': 'popularSection ${combine()[index].imageUrl} $index',
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}
