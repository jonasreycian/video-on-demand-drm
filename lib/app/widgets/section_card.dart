import 'package:aq_prime/app/providers/video_details_provider.dart';
import 'package:aq_prime/app/screens/video_details/video_details_screen.dart';
import 'package:aq_prime/app/widgets/loading_indicator.dart';
import 'package:aq_prime/app/widgets/thumbnail_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    required this.titleSection,
    required this.contents,
    this.isOnlyAqPrime = false,
    Key? key,
  }) : super(key: key);
  final String titleSection;
  final List contents;
  final bool isOnlyAqPrime; //malaki raw pag Only Aq Prime Section
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: isOnlyAqPrime ? 350 : 285,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              titleSection,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 21,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          contents.isNotEmpty
              ? Container(
                  height: isOnlyAqPrime ? 300 : 235,
                  color: Colors.transparent,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: contents.length,
                    itemBuilder: (context, index) {
                      return ThumbnailCard(
                        isOnlyAqprime: isOnlyAqPrime,
                        index: 0,
                        title: contents[index]['title'],
                        imageUrl: contents[index]['cover_photo_mobile'],
                        onTap: () {
                          Provider.of<VideoDetailsProvider>(context,
                                  listen: false)
                              .reset();
                          Navigator.of(context).pushNamed(
                            VideoDetailsPage.routeName,
                            arguments: contents[index],
                          );
                        },
                      );
                    },
                  ),
                )
              : Expanded(child: Center(child: AQLoadingIndicator())),
        ],
      ),
    );
  }
}
