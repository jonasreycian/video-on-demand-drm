import 'package:aq_prime/providers/my_watch_list_provider.dart';
import 'package:aq_prime/screens/search_screen.dart';
import 'package:aq_prime/screens/video_details/video_details_screen.dart';
import 'package:aq_prime/widgets/aq_floating_action_button.dart';
import 'package:aq_prime/widgets/search_button.dart';
import 'package:aq_prime/widgets/thumbnail_movie_card.dart';
import 'package:aq_prime/widgets/title_text_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWatchListScreen extends StatelessWidget {
  const MyWatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      floatingActionButton: AqFloatingActionButton(onPressed: () {}),
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: 'My Watch List'),
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
              Consumer<MyWatchListProvider>(
                builder: (context, value, child) {
                  return Container(
                    color: Colors.transparent,
                    child: value.myWatchList.isNotEmpty
                        ? GridView.builder(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            itemCount: value.myWatchList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 200, // here set custom Height You Want
                            ),
                            itemBuilder: (context, index) {
                              return ThumbnailCardForGrid(
                                index: index,
                                title: value.myWatchList[index].name!,
                                imageUrl: value.myWatchList[index].imageUrl!,
                                releaseYear: value.myWatchList[index].releaseYear!,
                                runTime: value.myWatchList[index].runTime!.inMinutes.toString(),
                                heroTag: 'myWatchList${value.myWatchList[index].imageUrl} $index',
                                onTap: () => Navigator.of(context).pushNamed(VideoDetailsPage.routeName, arguments: {
                                  'data': value.myWatchList[index],
                                  'heroTag': 'myWatchList${value.myWatchList[index].imageUrl} $index',
                                }),
                              );
                            },
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            width: double.infinity,
                            child: Center(
                              child: TitleTextCard(
                                name: 'Your Watch List will show here.',
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
