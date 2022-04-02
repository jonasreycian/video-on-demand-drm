import 'package:aq_prime/models/content_model.dart';
import 'package:aq_prime/widgets/episode_card.dart';
import 'package:flutter/material.dart';

class EpisodesTab extends StatelessWidget {
  const EpisodesTab({
    required this.episodes,
    Key? key,
  }) : super(key: key);
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
        itemCount: episodes.length,
        itemBuilder: (context, index) {
          return EpisodeCard(
            title: episodes[index].name!,
            runTime: episodes[index].runTime!,
            imageUrl: episodes[index].imageUrl!,
          );
        },
      ),
    );
  }
}
