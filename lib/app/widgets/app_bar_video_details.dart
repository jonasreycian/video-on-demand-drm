import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/utils/utils.dart';
import '../../device/utils/dialog.dart';
import '../../device/utils/hex_color.dart';
import '../../domain/entities/content.dart';
import '../providers/rating_provider.dart';
import '../providers/video_details_provider.dart';
import '../screens/better_player_screen.dart';
import 'icon_button_with_name.dart';
import 'mtrcb_rating.dart';
import 'primary_button.dart';
import 'secondary_button.dart';
import 'subtext_card.dart';

class AppBarVideoDetails extends StatefulWidget {
  AppBarVideoDetails({
    Key? key,
    required this.contentId,
    required this.content,
    required this.videoDetailsProvider,
    this.seasonSelectorCallback,
  }) : super(key: key);

  final int contentId;
  final Content content;
  final VideoDetailsProvider videoDetailsProvider;
  final Function(int seasonId)? seasonSelectorCallback;

  @override
  State<AppBarVideoDetails> createState() => _AppBarVideoDetailsState();
}

class _AppBarVideoDetailsState extends State<AppBarVideoDetails> {
  final Duration duration = Duration(milliseconds: 1000);
  int selectedSeasonIndex = 0;

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
              height: widget.content.type == 'series' ? 420 : 470,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.content.title ?? '--',
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
                          text: widget.content.releasedDate != null
                              ? DateFormat.y().format(
                                  DateTime.parse(widget.content.releasedDate!))
                              : '--',
                        ),
                        const SizedBox(width: 10),
                        MTRCBRating(rating: widget.content.mtrcbRating),
                        const SizedBox(width: 10),
                        widget.content.type == 'series'
                            ? Text(
                                '${widget.content.seasonsCount} ${widget.content.seasonsCount! > 1 ? 'Seasons' : 'Season'}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(width: 10),
                        widget.content.type != 'series'
                            ? Subtext(
                                text: widget.content.video?.runtime != null
                                    ? Utils.netflixDurationFormat(
                                        widget.content.video!.runtime!)
                                    : '--',
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Subtext(
                      text: widget.content.synopsis ?? '',
                      maxLines: 4,
                      textStyle: TextStyle(color: HexColor('#747474')),
                    ),
                    const SizedBox(height: 15),
                    ...widget.content.type != 'series'
                        ? [
                            Subtext(
                              text: 'Starring:',
                              maxLines: 2,
                            ),
                            const SizedBox(height: 4),
                            Subtext(
                              text: widget.content.cast!.join(', '),
                              maxLines: 3,
                              textStyle: TextStyle(
                                color: HexColor('#747474'),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Subtext(text: 'Director:'),
                            const SizedBox(height: 4),
                            Subtext(
                              text: widget.content.director ?? '--',
                              textStyle: TextStyle(
                                color: HexColor('#747474'),
                              ),
                            ),
                          ]
                        : [const SizedBox()],
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AddWatchListButton(
                          title: 'My List',
                          contentId: widget.content.id!,
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
                                        content: widget.content,
                                        provider: value,
                                        didRate: (rate) {
                                          widget.videoDetailsProvider
                                              .loadData(widget.contentId);
                                        });
                                  },
                                );
                              },
                            ),
                            Text(
                              widget.content.thumbsUpRatingCount != null &&
                                      widget.content.thumbsUpRatingCount! > 0
                                  ? widget.content.thumbsUpRatingCount
                                      .toString()
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
                        if (widget.content.video == null ||
                            widget.content.video!.hls == null) {
                          print('No hls url found');
                          return;
                        }
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                BetterPlayerScreen(widget.content.video!.hls!),
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
                    widget.content.type == 'series'
                        ? Container(
                            alignment: Alignment.center,
                            height: 41,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: HexColor('#747474'),
                              ),
                            ),
                            margin: const EdgeInsets.only(top: 32),
                            padding: const EdgeInsets.all(8),
                            child: DropdownButton<int>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              isDense: true,
                              value: selectedSeasonIndex + 1,
                              style: TextStyle(color: Colors.white),
                              items: widget.content.seasons!.map((season) {
                                return DropdownMenuItem<int>(
                                  value: season.id,
                                  onTap: () {},
                                  child: Text(
                                    'Season ${widget.content.seasons!.indexOf(season) + 1}',
                                  ),
                                );
                              }).toList(),
                              dropdownColor: Colors.black,
                              onChanged: (int? seasonId) {
                                if (widget.seasonSelectorCallback != null) {
                                  widget.seasonSelectorCallback!(seasonId!);
                                }
                                setState(() {
                                  var temp =
                                      widget.content.seasons!.singleWhere(
                                    (element) => element.id == seasonId,
                                  );
                                  selectedSeasonIndex =
                                      widget.content.seasons!.indexOf(temp);
                                });
                              },
                            ),
                          )
                        : const SizedBox(),
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
