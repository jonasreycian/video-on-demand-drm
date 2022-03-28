import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({
    this.isLast = false,
    required this.imageUrl,
    required this.fullName,
    required this.castName,
    Key? key,
  }) : super(key: key);
  final bool isLast;
  final String imageUrl;
  final String fullName;
  final String castName;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          horizontalOffset: 100,
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              color: Color.fromRGBO(30, 31, 65, 1),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            margin: EdgeInsets.only(right: isLast ? 0 : 20, bottom: 0),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Color.fromRGBO(209, 52, 53, 1).withOpacity(0.9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      fadeInCurve: Curves.easeInQuart,
                      fadeOutCurve: Curves.easeInQuart,
                      fadeOutDuration: const Duration(milliseconds: 1000),
                      fadeInDuration: const Duration(milliseconds: 200),
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                      placeholder: 'assets/images/loader1.gif',
                      image: imageUrl,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      fullName,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      castName,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
