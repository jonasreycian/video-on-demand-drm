import 'package:aq_prime/models/content_model.dart';
import 'package:aq_prime/widgets/app_bar_video_details.dart';
import 'package:aq_prime/widgets/movie_info_card_text.dart';
import 'package:aq_prime/widgets/sliver_appbar.dart';
import 'package:aq_prime/widgets/title_description_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
            children: [
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
                    MovieInfoCard(type: 'Film Type', value: filmType(data['data'].type), iconData: Icons.video_camera_back_outlined),
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

class MovieInfoCard extends StatelessWidget {
  const MovieInfoCard({
    required this.type,
    required this.value,
    required this.iconData,
    Key? key,
  }) : super(key: key);
  final String type;
  final String value;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          horizontalOffset: 100,
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              color: Color.fromRGBO(30, 31, 65, 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            margin: const EdgeInsets.only(right: 10, bottom: 10),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(iconData, color: Colors.white, size: 35),
                InfoMovieCardText(type: type, value: value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
