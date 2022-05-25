import 'package:aq_prime/app/screens/better_player_screen.dart';
import 'package:aq_prime/app/widgets/accessibility_card.dart';
import 'package:aq_prime/app/widgets/icon_button_with_name.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/secondary_button.dart';
import 'package:aq_prime/app/widgets/subtext_card.dart';
import 'package:aq_prime/data/utils/utils.dart';
import 'package:aq_prime/device/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

class AppBarVideoDetails extends StatelessWidget {
  AppBarVideoDetails({
    Key? key,
    this.title,
    this.releaseYear,
    this.description,
    this.cast,
    this.director,
    this.videoUrl,
    this.runTime,
    this.seasonCount,
  }) : super(key: key);

  final String? title;
  final String? releaseYear;
  final String? description;
  final String? cast;
  final String? director;
  final String? videoUrl;
  final int? runTime;
  final int? seasonCount;

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
                      title ?? '--',
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
                            text: releaseYear != null
                                ? DateFormat.yMMMMd()
                                    .format(DateTime.parse(releaseYear!))
                                : '--'),
                        const SizedBox(width: 10),
                        AccessibilityCard(
                          accessibility: '$seasonCount Seasons',
                        ),
                        const SizedBox(width: 10),
                        Subtext(
                          text: runTime != null
                              ? Utils.netflixDurationFormat(runTime ?? 0)
                              : '--',
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Subtext(
                      text: description ?? '',
                      maxLines: 4,
                    ),
                    const SizedBox(height: 15),
                    Subtext(
                      text: 'Starring: ',
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                    ),
                    Subtext(text: cast ?? '--', maxLines: 3),
                    const SizedBox(height: 15),
                    Subtext(
                      text: 'Director: ',
                      fontWeight: FontWeight.w700,
                    ),
                    AccessibilityCard(
                      accessibility: director ?? '--',
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AddWatchListButton(
                            title: 'My List',
                            isExisting: false,
                            onPressed: () {}),
                        const SizedBox(width: 10),
                        IconButtonWithName(
                          title: 'Rate',
                          iconData: icon(true),
                          onPressed: () {},
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      height: 50,
                      action: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                BetterPlayerScreen(videoUrl ?? ''),
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

  // String castToString(String? cast) {
  //   List cast1 = cast as List;
  //   late List names = [];
  //   for (var element in cast1) {
  //     names.add(element.fullName);
  //   }
  //   return names.join(', ');
  // }
}

///------------------------------------------------------------------------------
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
