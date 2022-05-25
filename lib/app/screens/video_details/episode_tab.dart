import 'package:aq_prime/app/screens/better_player_screen.dart';
import 'package:aq_prime/app/widgets/app_bar_video_details.dart';
import 'package:aq_prime/app/widgets/episode_card.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/material.dart';

class EpisodesTab extends StatelessWidget {
  const EpisodesTab({
    required this.content,
    Key? key,
  }) : super(key: key);
  final Content content;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarVideoDetails(
              contentId: content.id!,
              content: content,
              // title: content.title,
              // description: content.synopsis,
              // cast: content.cast == null ? '' : content.cast!.join(', '),
              // director: content.director,
              // releaseYear: content.releasedDate,
              // videoUrl: content.video?.hls,
              // runTime: content.video?.runtime,
              // seasonCount: content.seasonsCount,
            ),
            ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: content.seasons?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            BetterPlayerScreen(content.video?.hls! ?? ''),
                      ),
                    );
                  },
                  child: EpisodeCard(
                    index: index,
                    title: content.seasons?[index].title,
                    description: content.seasons?[index].description,
                    runTime: content.seasons?[index].runtime,
                    imageUrl: content.coverPhoto!,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
