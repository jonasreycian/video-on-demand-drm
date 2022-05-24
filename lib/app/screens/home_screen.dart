import 'package:aq_prime/app/providers/home_provider.dart';
import 'package:aq_prime/app/providers/refresh_limiter.dart';
import 'package:aq_prime/app/screens/search_screen.dart';
import 'package:aq_prime/app/widgets/aq_floating_action_button.dart';
import 'package:aq_prime/app/widgets/fetured_section.dart';
import 'package:aq_prime/app/widgets/search_button.dart';
import 'package:aq_prime/app/widgets/section_card.dart';
import 'package:aq_prime/app/widgets/title_text_card.dart';
import 'package:aq_prime/device/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initState(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      floatingActionButton: AqFloatingActionButton(onPressed: () {}),
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: 'Home'),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/images/AQ_PRIME_LOGO_2.png')),
        actions: [
          SearchButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(SearchScreen.routeName)),
        ],
      ),
      body: Consumer<HomeProvider>(builder: (context, value, child) {
        return SafeArea(
          child: RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.red,
            onRefresh: () => Future.delayed(
                const Duration(milliseconds: 100), () => onRefresh(context)),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeaturedSection(featuredList: value.featured),
                  SectionCard(
                    titleSection: 'Popular',
                    contents: value.popularOnAqPrime,
                  ),
                  SectionCard(
                    isOnlyAqPrime: true,
                    titleSection: 'Only on AQ Prime',
                    contents: value.onlyOnAqPrime,
                  ),
                  SectionCard(
                    titleSection: 'Top 10',
                    contents: value.top10Films,
                  ),
                  SectionCard(
                    titleSection: 'Trending Now',
                    contents: value.trendingNow,
                  ),
                  SectionCard(
                    titleSection: 'New Releases',
                    contents: value.newReleases,
                  ),
                  SectionCard(
                    titleSection: 'My Watch List',
                    contents: value.continueWatching,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  onRefresh(context) {
    RefreshLimit refreshLimit =
        Provider.of<RefreshLimit>(context, listen: false);
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    if (refreshLimit.onLimit) {
      refreshLimit.setCount();
      homeProvider.loadData(CategoryType.featured);
      homeProvider.loadData(CategoryType.popularOnAqPrime);
      homeProvider.loadData(CategoryType.onlyOnAqPrime);
      homeProvider.loadData(CategoryType.top10);
      homeProvider.loadData(CategoryType.trendingNow);
      homeProvider.loadData(CategoryType.newReleases);
      homeProvider.loadData(CategoryType.myWatchList);
    } else {
      refreshLimitDialog(context: context);
    }
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      HomeProvider homeProvider =
          Provider.of<HomeProvider>(context, listen: false);
      if (!homeProvider.isSuccess) {
        homeProvider.loadData(CategoryType.featured);
        homeProvider.loadData(CategoryType.popularOnAqPrime);
        homeProvider.loadData(CategoryType.onlyOnAqPrime);
        homeProvider.loadData(CategoryType.top10);
        homeProvider.loadData(CategoryType.trendingNow);
        homeProvider.loadData(CategoryType.newReleases);
        homeProvider.loadData(CategoryType.continueWatching);
      }
    });
  }
}
