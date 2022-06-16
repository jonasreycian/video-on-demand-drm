import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../device/utils/dialog.dart';
import '../providers/home_provider.dart';
import '../providers/refresh_limiter.dart';
import '../widgets/aq_floating_action_button.dart';
import '../widgets/fetured_section.dart';
import '../widgets/search_button.dart';
import '../widgets/section_card.dart';
import '../widgets/title_text_card.dart';
import 'search_screen.dart';

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
          child: Image.asset('assets/images/AQ_PRIME_LOGO_2.png'),
        ),
        actions: [
          SearchButton(onPressed: () {
            Navigator.of(context).pushNamed(SearchScreen.routeName);
          }),
        ],
      ),
      body: Consumer<HomeProvider>(builder: (context, value, child) {
        return SafeArea(
          child: RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.red,
            onRefresh: () => Future.delayed(
              const Duration(milliseconds: 100),
              () => onRefresh(context),
            ),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeaturedSection(featuredList: value.featured),
                  const SizedBox(height: 50),
                  SectionCard(
                    titleSection: 'Popular',
                    textPadding: const EdgeInsets.only(left: 16),
                    contents: value.popularOnAqPrime,
                  ),
                  const SizedBox(height: 16),
                  SectionCard(
                    isOnlyAqPrime: true,
                    titleSection: 'Only on AQ Prime',
                    textPadding: const EdgeInsets.only(left: 16),
                    contents: value.onlyOnAqPrime,
                  ),
                  const SizedBox(height: 16),
                  SectionCard(
                    titleSection: 'Top 10',
                    textPadding: const EdgeInsets.only(left: 16),
                    contents: value.top10Films,
                  ),
                  const SizedBox(height: 16),
                  SectionCard(
                    titleSection: 'Trending Now',
                    textPadding: const EdgeInsets.only(left: 16),
                    contents: value.trendingNow,
                  ),
                  const SizedBox(height: 16),
                  SectionCard(
                    titleSection: 'New Releases',
                    textPadding: const EdgeInsets.only(left: 16),
                    contents: value.newReleases,
                  ),
                  const SizedBox(height: 16),
                  SectionCard(
                    titleSection: 'My Watch List',
                    textPadding: const EdgeInsets.only(left: 16),
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
      homeProvider.loadData(CategoryType.continueWatching);
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
