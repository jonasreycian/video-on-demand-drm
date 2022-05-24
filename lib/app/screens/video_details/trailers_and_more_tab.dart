import 'package:aq_prime/app/widgets/trailers_card.dart';
import 'package:aq_prime/domain/entities/video.dart';
import 'package:flutter/material.dart';

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
                return TrailerCard(
                  index: index,
                  title: trailers[index].title,
                  description: trailers[index].description,
                  runTime: trailers[index].runtime,
                  imageUrl: '',
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
