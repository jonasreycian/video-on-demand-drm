import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../device/utils/dialog.dart';
import '../../domain/entities/content.dart';
import '../../domain/entities/person.dart';
import '../providers/better_player_provider.dart';
import '../providers/my_watch_list_provider.dart';
import '../providers/rating_provider.dart';
import '../screens/better_player_screen.dart';
import 'accessibility_card.dart';
import 'icon_button_with_name.dart';
import 'primary_button.dart';
import 'subtext_card.dart';

class AppBarVideoDetails extends StatelessWidget {
  AppBarVideoDetails({
    Key? key,
    required this.movieData,
  }) : super(key: key);

  final Content movieData;
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
              height: 460,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      movieData.title ?? '',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Subtext(text: movieData.releaseYear ?? ''),
                        const SizedBox(width: 10),
                        AccessibilityCard(accessibility: movieData.accessibility ?? ''),
                        const SizedBox(width: 10),
                        Subtext(text: netflixDurationFormat(movieData.runTime ?? const Duration(milliseconds: 1))),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Subtext(text: movieData.description ?? '', maxLines: 4),
                    const SizedBox(height: 15),
                    Subtext(text: 'Starring: ', fontWeight: FontWeight.w700),
                    Subtext(
                      text: castToString(movieData.cast ?? []),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 15),
                    Subtext(text: 'Director: ', fontWeight: FontWeight.w700),
                    Subtext(text: movieData.director?.fullName ?? ''),
                    const SizedBox(height: 15),
                    Subtext(text: 'More...', fontWeight: FontWeight.w700),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Consumer<MyWatchListProvider>(builder: (context, value, child) {
                          return AddWatchListButton(
                            title: 'My List',
                            isExisting: value.isExisting(movieData),
                            onPressed: value.isExisting(movieData) ? () => value.removeWatchList(movieData) : () => value.addMyWatchList(movieData),
                          );
                        }),
                        const SizedBox(width: 10),
                        Consumer<RatingProvider>(builder: (context, value, child) {
                          return IconButtonWithName(
                            title: 'Rate',
                            iconData: icon(value.isThumbsUp(movieData.title)),
                            onPressed: () => ratingPopup(
                              context: context,
                              isThumbUp: value.isThumbsUp(movieData.title),
                              movieName: movieData.title ?? '',
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Consumer<BetterPlayerProvider>(
                      builder: (context, value, child) {
                        return PrimaryButton(
                          height: 50,
                          action: () {
                            value.setCurrentContent(movieData);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => BetterPlayerScreen(movieData),
                              ),
                            );
                          },
                          width: double.infinity,
                          label: 'Play',
                        );
                      },
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

  String castToString(List<Person> castList) {
    late List names = [];
    for (var element in castList) {
      names.add(element.fullName);
    }
    return names.join(', ');
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
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
