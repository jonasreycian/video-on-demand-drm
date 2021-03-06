import 'package:flutter/material.dart';

import '../../data/extra/enums.dart';
import 'director_card.dart';
import 'genre_card.dart';
import 'movie_info_card.dart';
import 'profile_card.dart';
import 'section_title_card.dart';
import 'title_description_movie_card.dart';

class InfoBody extends StatelessWidget {
  const InfoBody({
    required this.data,
    Key? key,
  }) : super(key: key);
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Director'),
        DirectorCard(imageUrl: data['data'].director.imageUrl),
        SectionTitle(title: 'Cast'),
        Container(
          height: 195,
          child: ListView.builder(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data['data'].cast.length,
            itemBuilder: (context, index) {
              return ProfileCard(
                isLast: data['data'].cast.length == (index + 1),
                imageUrl: data['data'].cast[index].imageUrl,
                fullName: data['data'].cast[index].fullName,
                castName: data['data'].cast[index].castName,
              );
            },
          ),
        ),
        SectionTitle(title: 'Details'),
        TitleAndDecription(
            title: data['data'].title, description: data['data'].description),
        Container(
          height: 180,
          child: ListView(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              MovieInfoCard(
                  type: 'Duration',
                  value: '${data['data'].runTime.inMinutes.toString()} min',
                  iconData: Icons.timer_outlined),
              MovieInfoCard(
                  type: 'Release',
                  value: data['data'].releaseYear,
                  iconData: Icons.calendar_view_month_outlined),
              MovieInfoCard(
                  type: 'Accessibility',
                  value: data['data'].accessibility,
                  iconData: Icons.lock_outline_rounded),
              MovieInfoCard(
                  type: 'Film Type',
                  value: filmType(data['data'].type),
                  iconData: Icons.video_camera_back_outlined,
                  isLast: true),
            ],
          ),
        ),
        SectionTitle(title: 'Genre'),
        Container(
          height: 55,
          child: ListView.builder(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data['data'].genre.length,
            itemBuilder: (context, index) {
              return GenreCard(
                isLast: data['data'].genre.length == (index + 1),
                genreName: data['data'].genre[index],
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
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
