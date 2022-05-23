import 'package:aq_prime/app/widgets/subtext_card.dart';
import 'package:aq_prime/device/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TrailerCard extends StatelessWidget {
  const TrailerCard({
    required this.index,
    this.title,
    this.description,
    this.runTime,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final int index;
  final String? title;
  final String? description;
  final int? runTime;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 20,
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            padding: const EdgeInsets.only(left: 10),
            color: Colors.transparent,
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                      fadeInCurve: Curves.easeInQuart,
                      fadeOutCurve: Curves.easeInQuart,
                      fadeOutDuration: const Duration(milliseconds: 1000),
                      fadeInDuration: const Duration(milliseconds: 200),
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                      placeholderScale: 15,
                      placeholder: 'assets/images/loading1.gif',
                      image: imageUrl,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        title ?? '--',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Subtext(text: netflixDurationFormat(Duration(milliseconds: runTime ?? 0)), color: Color.fromRGBO(140, 140, 140, 1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
