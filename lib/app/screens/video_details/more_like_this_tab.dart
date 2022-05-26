import 'package:aq_prime/app/providers/releted_content_provider.dart';
import 'package:aq_prime/app/widgets/thumbnail_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'video_details_screen.dart';

class MoreLikeThisTab extends StatelessWidget {
  const MoreLikeThisTab({
    required this.contentId,
    Key? key,
  }) : super(key: key);

  final int contentId;

  init(BuildContext context, int contentId) {
    Future.delayed(const Duration(milliseconds: 1), () {
      RelatedContentProvider relatedContentProvider =
          Provider.of<RelatedContentProvider>(context, listen: false);
      if (!relatedContentProvider.isSuccess) {
        relatedContentProvider.loadData(contentId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    init(context, contentId);
    return Consumer<RelatedContentProvider>(
      builder: (context, value, child) {
        return Container(
          color: Colors.transparent,
          child: value.data!.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  itemCount: value.data!.length,
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
                      imageUrl: value.data![index].coverPhotoMobile!,
                      releaseYear: '2022',
                      runTime: 0.toString(),
                      heroTag:
                          'moreLikeThis${value.data![index].coverPhotoMobile} $index',
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          VideoDetailsPage.routeName,
                          arguments: VideoDetailsPageArguments(
                            videoId: value.data![index].videoId!,
                            heroTag: value.data![index].title!,
                          ),
                        );
                      },
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
      },
    );
  }
}
