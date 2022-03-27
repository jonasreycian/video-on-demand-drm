import 'package:aq_prime/models/content_model.dart';
import 'package:aq_prime/widgets/app_bar_video_details.dart';
import 'package:aq_prime/widgets/movie_info_card.dart';
import 'package:aq_prime/widgets/movie_info_card_text.dart';
import 'package:aq_prime/widgets/section_title_card.dart';
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

class ProfileCard extends StatelessWidget {
  ProfileCard({
    this.isLast = false,
    required this.imageUrl,
    required this.fullName,
    required this.castName,
    Key? key,
  }) : super(key: key);
  final bool isLast;
  final String imageUrl;
  final String fullName;
  final String castName;
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
            margin: EdgeInsets.only(right: isLast ? 0 : 20, bottom: 0),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipOval(
                    clipBehavior: Clip.hardEdge,
                    child: FadeInImage.assetNetwork(
                      fadeInCurve: Curves.easeInQuart,
                      fadeOutCurve: Curves.easeInQuart,
                      fadeOutDuration: const Duration(milliseconds: 1000),
                      fadeInDuration: const Duration(milliseconds: 200),
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                      placeholder: 'assets/images/loader1.gif',
                      image: imageUrl,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      fullName,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      castName,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
