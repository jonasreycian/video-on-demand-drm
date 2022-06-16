import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../data/utils/utils.dart';
import '../../device/utils/hex_color.dart';
import 'subtext_card.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    required this.index,
    required this.title,
    this.description = '',
    this.runTime,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final int index;
  final String title;
  final String description;
  final int? runTime;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index + 3,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 20,
          child: Container(
            // padding: const EdgeInsets.only(left: 10),
            color: Colors.transparent,
            height: 79,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 140,
                  height: 79,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: FadeInImage.assetNetwork(
                      fadeInCurve: Curves.easeInQuart,
                      fadeOutCurve: Curves.easeInQuart,
                      fadeOutDuration: const Duration(milliseconds: 1000),
                      fadeInDuration: const Duration(milliseconds: 200),
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                      placeholderScale: 1,
                      placeholder: 'assets/images/loading1.gif',
                      imageErrorBuilder: (context, data, trace) {
                        return Image.asset('assets/images/APP.png');
                      },
                      image: imageUrl,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Subtext(
                            text: Utils.netflixDurationFormat(runTime ?? 0),
                            color: HexColor('#747474'),
                            textStyle: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Subtext(
                        text: description,
                        textStyle: TextStyle(fontSize: 10),
                        maxLines: 3,
                        color: HexColor('#747474'),
                      ),
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
