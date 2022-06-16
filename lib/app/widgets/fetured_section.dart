import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../domain/entities/content.dart';
import '../screens/video_details/video_details_screen.dart';
import 'featured_banner_card.dart';
import 'loading_indicator.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({
    required this.featuredList,
    Key? key,
  }) : super(key: key);
  final List<Content> featuredList;

  @override
  Widget build(BuildContext context) {
    final Duration duration = const Duration(milliseconds: 500);
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: duration,
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 380,
                color: Colors.transparent,
                child: featuredList.isNotEmpty
                    ? CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 450,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(seconds: 5),
                          pageSnapping: true,
                        ),
                        itemCount: featuredList.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          return FeaturedBannerCard(
                            imageUrl: featuredList[index].coverPhotoMobile!,
                            onTap: () => Navigator.of(context).pushNamed(
                              VideoDetailsPage.routeName,
                              arguments: VideoDetailsPageArguments(
                                content: featuredList[index],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(child: AQLoadingIndicator()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
