import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/content.dart';
import '../../providers/episodes_provider.dart';
import '../../providers/video_details_provider.dart';
import '../../widgets/app_bar_video_details.dart';
import '../../widgets/episode_card.dart';
import '../better_player_screen.dart';

class EpisodesTab extends StatelessWidget {
  const EpisodesTab({
    required this.content,
    required this.videoDetailsProvider,
    Key? key,
  }) : super(key: key);
  final Content content;
  final VideoDetailsProvider videoDetailsProvider;

  init(BuildContext context, int contentId, int seasonId) {
    EpisodesProvider provider =
        Provider.of<EpisodesProvider>(context, listen: false);
    if (!provider.isSuccess) {
      provider.getEpisodes(contentId, seasonId);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (content.type == 'series') {
      init(context, content.id!, content.seasons![0].id!);
    }

    return Consumer<EpisodesProvider>(
      builder: (context, value, child) {
        return Container(
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBarVideoDetails(
                  contentId: content.id!,
                  content: content,
                  videoDetailsProvider: videoDetailsProvider,
                  seasonSelectorCallback: (seasonId) {
                    print('GOT SEASON ID ==> $seasonId');
                    value.getEpisodes(content.id!, seasonId);
                  },
                ),
                value.episodes.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.only(top: 10, bottom: 0),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: value.episodes.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return BetterPlayerScreen(
                                        content.video?.hls! ?? '');
                                  },
                                ),
                              );
                            },
                            child: EpisodeCard(
                              index: index,
                              title: value.episodes[index].title,
                              description: value.episodes[index].description,
                              runTime: value.episodes[index].runtime,
                              imageUrl: content.coverPhoto!,
                            ),
                          );
                        },
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
