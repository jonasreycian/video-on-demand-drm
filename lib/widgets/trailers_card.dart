import 'package:aq_prime/utilities/dialog.dart';
import 'package:aq_prime/widgets/subtext_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TrailerCard extends StatelessWidget {
  const TrailerCard({
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
      height: 350,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 285,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage.assetNetwork(
                    fadeInCurve: Curves.easeInQuart,
                    fadeOutCurve: Curves.easeInQuart,
                    fadeOutDuration: const Duration(milliseconds: 1000),
                    fadeInDuration: const Duration(milliseconds: 200),
                    fit: BoxFit.fitWidth,
                    placeholderFit: BoxFit.cover,
                    placeholderScale: 15,
                    placeholder: 'assets/images/loading1.gif',
                    image: imageUrl,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Trailer ${(index + 1)}: $title',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Subtext(text: netflixDurationFormat(runTime), color: Color.fromRGBO(140, 140, 140, 1)),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            child: AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 1500),
              child: FadeInAnimation(
                delay: const Duration(milliseconds: 1000),
                child: Container(
                  child: IconButton(
                    iconSize: 65,
                    alignment: Alignment.center,
                    tooltip: 'Play',
                    onPressed: () {},
                    icon: Icon(Icons.play_circle),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
