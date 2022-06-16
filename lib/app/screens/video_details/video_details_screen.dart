import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../device/utils/hex_color.dart';
import '../../../domain/entities/content.dart';
import '../../providers/releted_content_provider.dart';
import '../../providers/video_details_provider.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/sliver_appbar.dart';
import 'episode_tab.dart';
import 'more_like_this_tab.dart';
import 'trailers_and_more_tab.dart';

class VideoDetailsPageArguments {
  final Content content;
  VideoDetailsPageArguments({required this.content});
}

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({Key? key}) : super(key: key);
  static const routeName = '/videoDetailsPage';

  @override
  Widget build(BuildContext context) {
    final VideoDetailsPageArguments arguments =
        ModalRoute.of(context)!.settings.arguments as VideoDetailsPageArguments;
    final Content content = arguments.content;
    final int videoId = content.videoId!;
    final String heroTag = content.title!;
    final String type = content.type!;
    initState(context, videoId);
    return Consumer<VideoDetailsProvider>(
      child: AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(milliseconds: 1500),
        child: FadeInAnimation(
          duration: const Duration(milliseconds: 1500),
          child: SlideAnimation(
            verticalOffset: 10,
            child: TabBar(
              indicatorWeight: 5,
              onTap: (value) {},
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
                bottom: 10,
              ),
              labelPadding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: HexColor('#747474'),
              ),
              indicatorColor: Colors.red,
              labelStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white,
              ),
              isScrollable: true,
              tabs: [
                Text(type == 'series' ? 'EPISODES' : 'OVERVIEW'),
                Text('TRAILERS & MORE'),
                Text('MORE LIKE THIS'),
              ],
            ),
          ),
        ),
      ),
      builder: (context, value, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          child: value.content == null
              ? AQLoadingIndicatorScaffold()
              : AqPrimeSliverAppBar(
                  tabNumber: 3,
                  expandedHeight: 250,
                  title: value.content!.title!,
                  isImageUrl: true,
                  backgroundImage: value.content!.coverPhotoMobile,
                  heroTag: heroTag,
                  appBarContainer: const SizedBox(),
                  bottom: child!,
                  container: Container(
                    height: 550,
                    width: double.infinity,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        EpisodesTab(
                          videoDetailsProvider: value,
                          content: value.content!,
                        ),
                        TrailersAndMoreTab(
                          trailers: value.content!.trailers ?? [],
                        ),
                        MoreLikeThisTab(
                          contentId: value.content!.id!,
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  initState(BuildContext context, int contentId) {
    Future.delayed(const Duration(milliseconds: 1), () {
      Provider.of<VideoDetailsProvider>(context, listen: false)
          .loadData(contentId);
      Provider.of<RelatedContentProvider>(context, listen: false).reset();
    });
  }
}
