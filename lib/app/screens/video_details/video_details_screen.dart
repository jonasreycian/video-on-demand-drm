import 'package:aq_prime/app/providers/releted_content_provider.dart';
import 'package:aq_prime/app/providers/video_details_provider.dart';
import 'package:aq_prime/app/screens/video_details/episode_tab.dart';
import 'package:aq_prime/app/screens/video_details/more_like_this_tab.dart';
import 'package:aq_prime/app/screens/video_details/trailers_and_more_tab.dart';
import 'package:aq_prime/app/widgets/loading_indicator.dart';
import 'package:aq_prime/app/widgets/sliver_appbar.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class VideoDetailsPageArguments {
  final int videoId;
  final String heroTag;
  VideoDetailsPageArguments({required this.videoId, required this.heroTag});
}

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({Key? key}) : super(key: key);
  static const routeName = '/videoDetailsPage';

  @override
  Widget build(BuildContext context) {
    final VideoDetailsPageArguments arguments =
        ModalRoute.of(context)!.settings.arguments as VideoDetailsPageArguments;
    final int videoId = arguments.videoId;
    final String heroTag = arguments.heroTag;
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
                Text('EPISODES'),
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
          child: value.data == null
              ? AQLoadingIndicatorScaffold()
              : AqPrimeSliverAppBar(
                  tabNumber: 3,
                  expandedHeight: 250,
                  title: value.data!.title!,
                  isImageUrl: true,
                  backgroundImage: value.data!.coverPhotoMobile,
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
                          content: value.data!,
                        ),
                        TrailersAndMoreTab(
                          trailers: value.data!.trailers ?? [],
                        ),
                        MoreLikeThisTab(
                          contentId: value.data!.id!,
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
