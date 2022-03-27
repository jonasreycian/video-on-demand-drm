import 'package:aq_prime/widgets/app_bar_video_details.dart';
import 'package:aq_prime/widgets/sliver_appbar.dart';
import 'package:flutter/material.dart';

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({Key? key}) : super(key: key);
  static const routeName = '/videoDetailsPage';
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return PrimeSliverAppBar(
      title: data['data'].name!,
      isImageUrl: false,
      backgroundImage: data['data'].imageUrl,
      heroTag: data['heroTag'],
      appBarContainer: AppBarVideoDetails(rating: 'Rating: ' + data['data'].rate! + ' / 10'),
      container: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
