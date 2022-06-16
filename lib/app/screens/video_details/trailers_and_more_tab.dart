import 'package:flutter/material.dart';

import '../../../domain/entities/video.dart';
import '../../widgets/trailers_card.dart';
import '../better_player_screen.dart';

class TrailersAndMoreTab extends StatelessWidget {
  const TrailersAndMoreTab({
    required this.trailers,
    Key? key,
  }) : super(key: key);
  final List<Video> trailers;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: trailers.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: trailers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            BetterPlayerScreen(trailers[index].hls!),
                      ),
                    );
                  },
                  child: TrailerCard(
                    index: index,
                    title: trailers[index].title ?? '',
                    description: trailers[index].description ?? '',
                    runTime: trailers[index].runtime,
                    imageUrl: trailers[index].coverPhoto ?? '',
                  ),
                );
              },
            )
          : SizedBox(
              width: double.infinity,
              child: Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 2.5,
                  ),
                ),
              ),
            ),
    );
  }
}
