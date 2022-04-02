import 'package:aq_prime/utilities/dialog.dart';
import 'package:aq_prime/widgets/subtext_card.dart';
import 'package:flutter/material.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    required this.index,
    required this.title,
    required this.runTime,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final int index;
  final String title;
  final Duration runTime;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                placeholder: 'assets/images/loader1.gif',
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
                  '${(index + 1)}. $title',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Subtext(text: netflixDurationFormat(runTime)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
