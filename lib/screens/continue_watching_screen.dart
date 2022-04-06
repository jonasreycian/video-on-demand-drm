import 'package:aq_prime/data/data.dart';
import 'package:aq_prime/screens/search_screen.dart';
import 'package:aq_prime/screens/video_details/video_details_screen.dart';
import 'package:aq_prime/widgets/aq_floating_action_button.dart';
import 'package:aq_prime/widgets/search_button.dart';
import 'package:aq_prime/widgets/thumbnail_movie_card.dart';
import 'package:aq_prime/widgets/title_text_card.dart';
import 'package:flutter/material.dart';

class ContinueWatchingScreen extends StatelessWidget {
  const ContinueWatchingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      floatingActionButton: AqFloatingActionButton(onPressed: () {}),
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: 'Continue Watching'),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: Padding(padding: const EdgeInsets.only(left: 10), child: Image.asset('assets/images/AQ_PRIME_LOGO_2.png')),
        actions: [
          SearchButton(onPressed: () => Navigator.of(context).pushNamed(SearchScreen.routeName)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                child: GridView.builder(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  itemCount: combine1().length,
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
                      // title: value.myWatchList[index].name!,
                      imageUrl: combine1()[index].imageUrl!,
                      releaseYear: combine1()[index].releaseYear!,
                      runTime: combine1()[index].runTime!.inMinutes.toString(),
                      heroTag: 'continueWatch${combine1()[index].imageUrl} $index',
                      onTap: () => Navigator.of(context).pushNamed(VideoDetailsPage.routeName, arguments: {
                        'data': combine1()[index],
                        'heroTag': 'continueWatch${combine1()[index].imageUrl} $index',
                      }),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
