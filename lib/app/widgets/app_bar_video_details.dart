import 'package:aq_prime/app/providers/rating_provider.dart';
import 'package:aq_prime/app/providers/video_details_provider.dart';
import 'package:aq_prime/app/screens/better_player_screen.dart';
import 'package:aq_prime/app/widgets/icon_button_with_name.dart';
import 'package:aq_prime/app/widgets/mtrcb_rating.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/secondary_button.dart';
import 'package:aq_prime/app/widgets/subtext_card.dart';
import 'package:aq_prime/device/utils/dialog.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:aq_prime/domain/entities/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppBarVideoDetails extends StatelessWidget {
  AppBarVideoDetails({
    Key? key,
    required this.contentId,
    required this.content,
    required this.videoDetailsProvider,
  }) : super(key: key);

  final int contentId;
  final Content content;
  final VideoDetailsProvider videoDetailsProvider;
  final Duration duration = Duration(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(milliseconds: 500),
        child: FadeInAnimation(
          child: SlideAnimation(
            verticalOffset: 100,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: 470,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      content.title ?? '--',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Subtext(
                          text: content.releasedDate != null
                              ? DateFormat.y()
                                  .format(DateTime.parse(content.releasedDate!))
                              : '--',
                        ),
                        const SizedBox(width: 10),
                        MTRCBRating(rating: content.mtrcbRating),
                        const SizedBox(width: 10),
                        Text(
                          '${content.seasonsCount} ${content.seasonsCount! > 1 ? 'Seasons' : 'Season'}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Subtext(
                        //   text: content.video?.runtime != null
                        //       ? Utils.netflixDurationFormat(
                        //           content.video!.runtime!)
                        //       : '--',
                        // ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Subtext(
                      text: content.synopsis ?? '',
                      maxLines: 4,
                      textStyle: TextStyle(color: HexColor('#747474')),
                    ),
                    const SizedBox(height: 15),
                    // Subtext(
                    //   text: 'Starring: ',
                    //   fontWeight: FontWeight.w700,
                    //   maxLines: 2,
                    // ),
                    // Subtext(
                    //   text: content.cast!.join(', '),
                    //   maxLines: 3,
                    // ),
                    const SizedBox(height: 15),
                    // Subtext(
                    //   text: 'Director: ',
                    //   fontWeight: FontWeight.w700,
                    // ),
                    // AccessibilityCard(
                    //   accessibility: content.director ?? '--',
                    // ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AddWatchListButton(
                          title: 'My List',
                          contentId: content.id!,
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            Consumer<RatingProvider>(
                              builder: (_context, value, child) {
                                return IconButtonWithName(
                                  title: 'Rate',
                                  iconData: icon(null),
                                  onPressed: () {
                                    ratingPopup(
                                        context: context,
                                        isThumbUp: true,
                                        content: content,
                                        provider: value,
                                        didRate: (rate) {
                                          videoDetailsProvider
                                              .loadData(contentId);
                                        });
                                  },
                                );
                              },
                            ),
                            Text(
                              content.thumbsUpRatingCount != null &&
                                      content.thumbsUpRatingCount! > 0
                                  ? content.thumbsUpRatingCount.toString()
                                  : '',
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor('#747474'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      height: 50,
                      action: () {
                        if (content.video == null ||
                            content.video!.hls == null) {
                          print('No hls url found');
                          return;
                        }
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                BetterPlayerScreen(content.video!.hls!),
                          ),
                        );
                      },
                      width: double.infinity,
                      label: 'Play',
                    ),
                    const SizedBox(height: 20),
                    SecondaryButton(
                      height: 50,
                      action: () {},
                      width: double.infinity,
                      label: 'Watch Trailer',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData icon(bool? value) {
    if (value == null) {
      return Icons.thumb_up_alt_outlined;
    }
    if (value) {
      return Icons.thumb_up_alt;
    } else {
      return Icons.thumb_down_alt;
    }
  }
}

class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 100);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'This is a nice overlay',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Dismiss'),
          )
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
