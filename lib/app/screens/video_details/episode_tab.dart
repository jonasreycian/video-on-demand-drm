import 'package:aq_prime/app/widgets/app_bar_video_details.dart';
import 'package:aq_prime/app/widgets/episode_card.dart';
import 'package:flutter/material.dart';

class EpisodesTab extends StatelessWidget {
  const EpisodesTab({
    required this.episodeData,
    Key? key,
  }) : super(key: key);
  final Map episodeData;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarVideoDetails(
              title: episodeData['title'],
              description: episodeData['synopsis'],
              cast: episodeData['cast'],
              director: episodeData['director'],
              releaseYear: episodeData['released_date'],
              videoUrl: episodeData['video']['hls'],
              runTime: episodeData['video']['runtime'],
              seasonCount: episodeData['seasons_count'],
            ),
            ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: episodeData['trailers'].length,
              itemBuilder: (context, index) {
                return EpisodeCard(
                  index: index,
                  title: episodeData['trailers'][index]['title'],
                  description: episodeData['trailers'][index]['description'],
                  runTime: episodeData['trailers'][index]['runtime'],
                  imageUrl: episodeData['cover_photo'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
