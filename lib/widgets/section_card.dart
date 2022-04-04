import 'package:aq_prime/screens/video_details/video_details_screen.dart';
import 'package:aq_prime/widgets/thumbnail_movie_card.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    required this.titleSection,
    required this.data,
    Key? key,
  }) : super(key: key);
  final String titleSection;
  final List<dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            titleSection,
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
          height: 200,
          color: Colors.transparent,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ThumbnailCard(
                title: data[index].name!,
                imageUrl: data[index].imageUrl!,
                releaseYear: data[index].releaseYear!,
                runTime: data[index].runTime!.inMinutes.toString(),
                heroTag: '$titleSection ${data[index].imageUrl} $index',
                onTap: () => Navigator.of(context).pushNamed(VideoDetailsPage.routeName, arguments: {
                  'data': data[index],
                  'heroTag': '$titleSection ${data[index].imageUrl} $index',
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}
