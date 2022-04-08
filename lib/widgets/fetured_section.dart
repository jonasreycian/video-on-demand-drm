import 'package:aq_prime/data/data.dart';
import 'package:aq_prime/screens/video_details/video_details_screen.dart';
import 'package:aq_prime/widgets/featured_banner_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({
    Key? key,
  }) : super(key: key);

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
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 450,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(seconds: 5),
                    pageSnapping: true,
                  ),
                  itemCount: combine().length,
                  itemBuilder: (BuildContext context, int index, int pageViewIndex) {
                    return FeaturedBannerCard(
                      imageUrl: combine()[index].imageUrl!,
                      title: combine()[index].name!,
                      releaseYear: combine()[index].releaseYear!,
                      runTime: combine()[index].runTime!.inMinutes.toString(),
                      heroTag: 'featured ${combine()[index].imageUrl} $index',
                      onTap: () => Navigator.of(context).pushNamed(VideoDetailsPage.routeName, arguments: {
                        'data': combine()[index],
                        'heroTag': 'featured ${combine()[index].imageUrl} $index',
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
