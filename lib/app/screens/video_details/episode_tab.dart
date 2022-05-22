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
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) {
          // if (index > 0 && episodeData.isNotEmpty) {
          //   // return EpisodeCard(
          //   //   index: index,
          //   //   title: episodes[index - 1].name!,
          //   //   runTime: episodes[index - 1].runTime!,
          //   //   imageUrl: episodes[index - 1].imageUrl!,
          //   // );
          //   return const SizedBox();
          // } else {
          //   return AppBarVideoDetails(
          //     title: episodeData['title'],
          //   );
          // }
          return AppBarVideoDetails(
            title: episodeData['title'],
            description: episodeData['synopsis'],
            cast: episodeData['cast'],
            director: episodeData['director'],
            releaseYear: episodeData['released_date'],
            videoUrl: episodeData['video']['hls'],
            runTime: episodeData['video']['runtime'],
            seasonCount: episodeData['seasons_count'],
          );
        },
      ),
    );
  }
}
