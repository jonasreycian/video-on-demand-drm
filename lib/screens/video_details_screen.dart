import 'package:aq_prime/models/content_model.dart';
import 'package:aq_prime/widgets/app_bar_video_details.dart';
import 'package:aq_prime/widgets/movie_info_card.dart';
import 'package:aq_prime/widgets/profile_card.dart';
import 'package:aq_prime/widgets/section_title_card.dart';
import 'package:aq_prime/widgets/sliver_appbar.dart';
import 'package:aq_prime/widgets/title_description_movie_card.dart';
import 'package:flutter/material.dart';

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({Key? key}) : super(key: key);
  static const routeName = '/videoDetailsPage';
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return AqPrimeSliverAppBar(
      title: data['data'].name!,
      isImageUrl: false,
      backgroundImage: data['data'].imageUrl,
      heroTag: data['heroTag'],
      appBarContainer: AppBarVideoDetails(rating: 'Rating: ' + data['data'].rate! + ' / 10'),
      container: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: 'Cast'),
              Container(
                height: 195,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data['data'].cast.length,
                  itemBuilder: (context, index) {
                    return ProfileCard(
                      isLast: data['data'].cast.length == (index + 1) ? true : false,
                      imageUrl: data['data'].cast[index].imageUrl,
                      fullName: data['data'].cast[index].fullName,
                      castName: data['data'].cast[index].castName,
                    );
                  },
                ),
              ),
              SectionTitle(title: 'Video Details'),
              TitleAndDecription(title: data['data'].name, description: data['data'].description),
              Container(
                height: 180,
                child: ListView(
                  padding: const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MovieInfoCard(type: 'Duration', value: '${data['data'].runTime.inMinutes.toString()} min', iconData: Icons.timer_outlined),
                    MovieInfoCard(type: 'Release', value: data['data'].releaseYear, iconData: Icons.calendar_today_outlined),
                    MovieInfoCard(type: 'Accessibility', value: data['data'].accessibility, iconData: Icons.lock_outline_rounded),
                    MovieInfoCard(type: 'Film Type', value: filmType(data['data'].type), iconData: Icons.video_camera_back_outlined, isLast: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String filmType(FilmType value) {
    if (value == FilmType.anime) {
      return 'Anime';
    }
    if (value == FilmType.movie) {
      return 'Movie';
    }
    if (value == FilmType.series) {
      return 'Series';
    } else {
      return '';
    }
  }
}
