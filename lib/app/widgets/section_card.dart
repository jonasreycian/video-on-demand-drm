import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/content.dart';
import '../providers/video_details_provider.dart';
import '../screens/video_details/video_details_screen.dart';
import 'loading_indicator.dart';
import 'thumbnail_movie_card.dart';

class SectionCard extends StatelessWidget {
  SectionCard({
    required this.titleSection,
    required this.contents,
    this.isOnlyAqPrime = false,
    this.margin = const EdgeInsets.all(0),
    this.textPadding = const EdgeInsets.all(0),
    Key? key,
  }) : super(key: key);
  final String titleSection;
  final List<Content> contents;
  final bool isOnlyAqPrime;
  final EdgeInsets margin;
  final EdgeInsets textPadding;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isOnlyAqPrime ? 320 : 240,
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: textPadding,
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
              ? Stack(
                  children: [
                    Container(
                      height: isOnlyAqPrime ? 260 : 190,
                      color: Colors.transparent,
                      child: ListView.builder(
                        controller: scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: contents.length,
                        itemBuilder: (context, index) {
                          return ThumbnailCard(
                            index: 0,
                            height: isOnlyAqPrime ? 235 : 160,
                            title: contents[index].title,
                            imageUrl: contents[index].coverPhotoMobile!,
                            onTap: () {
                              Provider.of<VideoDetailsProvider>(
                                context,
                                listen: false,
                              ).reset();
                              Navigator.of(context).pushNamed(
                                VideoDetailsPage.routeName,
                                arguments: VideoDetailsPageArguments(
                                  content: contents[index],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    ...kIsWeb
                        ? [
                            Positioned(
                              height: isOnlyAqPrime ? 260 : 190,
                              left: 0,
                              child: Container(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_back_rounded),
                                ),
                              ),
                            ),
                            Positioned(
                              height: isOnlyAqPrime ? 260 : 190,
                              right: 0,
                              child: Container(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_rounded),
                                ),
                              ),
                            ),
                          ]
                        : [const SizedBox()],
                  ],
                )
              : Expanded(
                  child: Center(
                    child: AQLoadingIndicator(),
                  ),
                ),
        ],
      ),
    );
  }
}
