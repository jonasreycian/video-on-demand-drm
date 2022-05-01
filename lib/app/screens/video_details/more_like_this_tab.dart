import 'package:flutter/material.dart';

import '../../../domain/entities/content.dart';
import '../../widgets/thumbnail_movie_card.dart';
import 'video_details_screen.dart';

class MoreLikeThisTab extends StatelessWidget {
  const MoreLikeThisTab({
    required this.moreLikeThis,
    Key? key,
  }) : super(key: key);
  final List<Content> moreLikeThis;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: moreLikeThis.isNotEmpty
          ? GridView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              itemCount: moreLikeThis.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 175, // here set custom Height You Want
              ),
              itemBuilder: (context, index) {
                return ThumbnailCardForGrid(
                  index: index,
                  imageUrl: moreLikeThis[index].imageUrl!,
                  releaseYear: moreLikeThis[index].releaseYear!,
                  runTime: moreLikeThis[index].runTime!.inMinutes.toString(),
                  heroTag: 'moreLikeThis${moreLikeThis[index].imageUrl} $index',
                  onTap: () => Navigator.of(context)
                      .pushNamed(VideoDetailsPage.routeName, arguments: {
                    'data': moreLikeThis[index],
                    'heroTag':
                        'moreLikeThis${moreLikeThis[index].imageUrl} $index',
                  }),
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

class MovieThumbNail extends StatelessWidget {
  const MovieThumbNail({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
