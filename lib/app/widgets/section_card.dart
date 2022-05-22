import 'package:aq_prime/app/screens/video_details/video_details_screen.dart';
import 'package:aq_prime/app/widgets/thumbnail_movie_card.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    required this.titleSection,
    required this.contents,
    Key? key,
  }) : super(key: key);
  final String titleSection;
  final List contents;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 285,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              titleSection,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 21,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 235,
            color: Colors.transparent,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: contents.length,
              itemBuilder: (context, index) {
                return ThumbnailCard(
                  index: 0,
                  title: contents[index]['title'],
                  imageUrl: contents[index]['cover_photo_mobile'],
                  heroTag: '$titleSection ${contents[index]['cover_photo_mobile']} $index',
                  onTap: () => Navigator.of(context).pushNamed(VideoDetailsPage.routeName, arguments: {
                    'content': contents[index],
                    'heroTag': '$titleSection ${contents[index]['cover_photo_mobile']} $index',
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
