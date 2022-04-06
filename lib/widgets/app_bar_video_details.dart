import 'package:aq_prime/models/content_model.dart';
import 'package:aq_prime/utilities/dialog.dart';
import 'package:aq_prime/widgets/accessibility_card.dart';
import 'package:aq_prime/widgets/icon_button_with_name.dart';
import 'package:aq_prime/widgets/subtext_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AppBarVideoDetails extends StatelessWidget {
  const AppBarVideoDetails({
    Key? key,
    required this.title,
    required this.yearRelease,
    required this.accessibility,
    required this.runTime,
    required this.description,
    required this.castList,
    required this.director,
  }) : super(key: key);

  final String title;
  final String yearRelease;
  final String accessibility;
  final Duration runTime;
  final String description;
  final List<Person> castList;
  final String director;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 100,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            width: double.infinity,
            height: 370,
            decoration: BoxDecoration(
              color: Colors.black,
              // borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
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
                    Subtext(text: yearRelease),
                    const SizedBox(width: 10),
                    AccessibilityCard(accessibility: accessibility),
                    const SizedBox(width: 10),
                    Subtext(text: netflixDurationFormat(runTime)),
                  ],
                ),
                const SizedBox(height: 5),
                Subtext(text: description, maxLines: 5),
                const SizedBox(height: 5),
                Subtext(text: 'Starring: ', fontWeight: FontWeight.w700),
                const SizedBox(height: 5),
                Subtext(text: castToString(castList)),
                const SizedBox(height: 5),
                Subtext(text: 'Director: ', fontWeight: FontWeight.w700),
                const SizedBox(height: 5),
                Subtext(text: director),
                const SizedBox(height: 10),
                Subtext(text: 'More...', fontWeight: FontWeight.w700),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButtonWithName(title: 'My List', iconData: Icons.add_outlined, onPressed: () {}),
                    const SizedBox(width: 10),
                    IconButtonWithName(title: 'Rate', iconData: Icons.thumb_up_outlined, onPressed: () {}),
                  ],
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
