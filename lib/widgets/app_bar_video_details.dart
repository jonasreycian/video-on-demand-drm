import 'package:aq_prime/models/content_model.dart';
import 'package:aq_prime/providers/my_watch_list_provider.dart';
import 'package:aq_prime/utilities/dialog.dart';
import 'package:aq_prime/widgets/accessibility_card.dart';
import 'package:aq_prime/widgets/icon_button_with_name.dart';
import 'package:aq_prime/widgets/primary_button.dart';
import 'package:aq_prime/widgets/subtext_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class AppBarVideoDetails extends StatelessWidget {
  const AppBarVideoDetails({
    Key? key,
    required this.movieData,
  }) : super(key: key);

  final Content movieData;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 100,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            height: 360,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  movieData.name ?? '',
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
                const SizedBox(height: 5),
                Subtext(text: movieData.description ?? '', maxLines: 2),
                const SizedBox(height: 5),
                Subtext(text: 'Starring: ', fontWeight: FontWeight.w700),
                const SizedBox(height: 5),
                Subtext(text: castToString(movieData.cast ?? [])),
                const SizedBox(height: 5),
                Subtext(text: 'Director: ', fontWeight: FontWeight.w700),
                const SizedBox(height: 5),
                Subtext(text: movieData.director?.fullName ?? ''),
                const SizedBox(height: 10),
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
                    IconButtonWithName(
                      title: 'Rate',
                      iconData: Icons.thumb_up_outlined,
                      onPressed: () {
                        ratingPopup(context: context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  height: 50,
                  action: () {},
                  width: double.infinity,
                  label: 'Play',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String castToString(List<Person> castList) {
    late List names = [];
    for (var element in castList) {
      names.add(element.fullName);
    }
    return names.join(', ');
  }
}
