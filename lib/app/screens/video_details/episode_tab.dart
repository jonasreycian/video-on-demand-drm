import 'package:flutter/material.dart';

import '../../../domain/entities/content.dart';
import '../../../domain/entities/episode.dart';
import '../../widgets/app_bar_video_details.dart';
import '../../widgets/episode_card.dart';

class EpisodesTab extends StatelessWidget {
  const EpisodesTab({
    required this.episodes,
    required this.movieData,
    Key? key,
  }) : super(key: key);
  final Content movieData;
  final List<Episode> episodes;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: episodes.length + 1,
        itemBuilder: (context, index) {
          if (index > 0 && episodes.isNotEmpty) {
            return EpisodeCard(
              index: index,
              title: episodes[index - 1].name!,
              runTime: episodes[index - 1].runTime!,
              imageUrl: episodes[index - 1].imageUrl!,
            );
          } else {
            return AppBarVideoDetails(movieData: movieData);
          }
        },
      ),
    );
  }
}