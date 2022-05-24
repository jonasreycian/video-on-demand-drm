import 'package:aq_prime/app/providers/video_details_provider.dart';
import 'package:aq_prime/app/screens/video_details/episode_tab.dart';
import 'package:aq_prime/app/screens/video_details/trailers_and_more_tab.dart';
import 'package:aq_prime/app/widgets/loading_indicator.dart';
import 'package:aq_prime/app/widgets/sliver_appbar.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({Key? key}) : super(key: key);
  static const routeName = '/videoDetailsPage';
  @override
  Widget build(BuildContext context) {
    final Map content = ModalRoute.of(context)!.settings.arguments as Map;
    initState(context, content['id']);
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
                    left: 20, right: 20, top: 5, bottom: 10),
                labelPadding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                labelColor: Colors.white,
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: HexColor('#7D9297'),
                ),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.red,
                labelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: HexColor('#006B83'),
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
          return AqPrimeSliverAppBar(
            tabNumber: 3,
            expandedHeight: 250,
            title: content['title'],
            isImageUrl: true,
            backgroundImage: content['cover_photo'],
            heroTag: '',
            appBarContainer: const SizedBox(),
            bottom: child!,
            container: Container(
              height: 550,
              width: double.infinity,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  value.isSuccess
                      ? EpisodesTab(episodeData: value.data)
                      : AQLoadingIndicator(),
                  value.isSuccess
                      ? TrailersAndMoreTab(trailers: value.data)
                      : AQLoadingIndicator(),
                  const SizedBox(),

                  // MoreLikeThisTab(moreLikeThis: movieData.moreLikeThis ?? []),
                ],
              ),
            ),
          );
        });
  }

  initState(BuildContext context, int contentId) {
    Future.delayed(const Duration(milliseconds: 1), () {
      VideoDetailsProvider videoDetailsProvider =
          Provider.of<VideoDetailsProvider>(context, listen: false);
      videoDetailsProvider.loadData(contentId);
    });
  }
}
