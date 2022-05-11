import 'package:aq_prime/models/content_model.dart';
import 'package:aq_prime/screens/video_details/episode_tab.dart';
import 'package:aq_prime/screens/video_details/more_like_this_tab.dart';
import 'package:aq_prime/screens/video_details/trailers_and_more_tab.dart';
import 'package:aq_prime/utilities/hex_color.dart';
import 'package:aq_prime/widgets/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({Key? key}) : super(key: key);
  static const routeName = '/videoDetailsPage';
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    final Content movieData = data['data'];
    return AqPrimeSliverAppBar(
      tabNumber: 3,
      expandedHeight: 250,
      title: movieData.name!,
      isImageUrl: false,
      backgroundImage: movieData.imageUrl,
      heroTag: data['heroTag'],
      appBarContainer: const SizedBox(),
      bottom: AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(milliseconds: 1500),
        child: FadeInAnimation(
          duration: const Duration(milliseconds: 1500),
          child: SlideAnimation(
            verticalOffset: 10,
            child: TabBar(
              indicatorWeight: 5,
              onTap: (value) {},
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
              labelPadding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
      container: SizedBox(
        height: 750,
        width: double.infinity,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            EpisodesTab(episodes: movieData.episode ?? [], movieData: movieData),
            TrailersAndMoreTab(trailers: movieData.episode ?? []),
            MoreLikeThisTab(moreLikeThis: movieData.moreLikeThis ?? []),
          ],
        ),
      ),
    );
  }
}