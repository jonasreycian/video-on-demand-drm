import 'package:aq_prime/app/providers/home_provider.dart';
import 'package:aq_prime/app/providers/refresh_limiter.dart';
import 'package:aq_prime/app/screens/search_screen.dart';
import 'package:aq_prime/app/widgets/aq_floating_action_button.dart';
import 'package:aq_prime/app/widgets/fetured_section.dart';
import 'package:aq_prime/app/widgets/loading_indicator.dart';
import 'package:aq_prime/app/widgets/no_data_dialog.dart';
import 'package:aq_prime/app/widgets/only_aqprime_section.dart';
import 'package:aq_prime/app/widgets/others_section.dart';
import 'package:aq_prime/app/widgets/popular_section.dart';
import 'package:aq_prime/app/widgets/search_button.dart';
import 'package:aq_prime/app/widgets/section_card.dart';
import 'package:aq_prime/app/widgets/title_text_card.dart';
import 'package:aq_prime/app/widgets/top_ten_section.dart';
import 'package:aq_prime/app/widgets/trending_section.dart';
import 'package:aq_prime/data/extra/data.dart';
import 'package:aq_prime/device/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
        return Stack(
          children: [
            if (!value.isSuccess) ...[AQLoadingIndicator()],
            if (value.isSuccess && value.data.isEmpty) ...[AQNoData()],
            if (value.isSuccess && value.data.isNotEmpty) ...[
              SafeArea(
                child: RefreshIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.red,
                  onRefresh: () => Future.delayed(
                      const Duration(milliseconds: 100),
                      () => onRefresh(context)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimationConfiguration.staggeredList(
                          position: 0,
                          duration: const Duration(milliseconds: 500),
                          child: FadeInAnimation(
                            child: SlideAnimation(
                              verticalOffset: 100,
                              child: FeaturedSection(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        PopularSection(),
                        const SizedBox(height: 15),
                        OnlyAQprimeSection(),
                        const SizedBox(height: 15),
                        TopTenSection(),
                        const SizedBox(height: 15),
                        SectionCard(
                            titleSection: 'New Releases', data: combine()),
                        const SizedBox(height: 15),
                        SectionCard(
                            titleSection: 'My Watch List', data: trending),
                        const SizedBox(height: 15),
                        SectionCard(titleSection: 'Comedy', data: trending),
                        const SizedBox(height: 15),
                        SectionCard(titleSection: 'Action', data: trending),
                        const SizedBox(height: 15),
                        SectionCard(titleSection: 'Horror', data: trending),
                        const SizedBox(height: 15),
                        SectionCard(titleSection: 'Drama', data: trending),
                        const SizedBox(height: 15),
                        SectionCard(titleSection: 'Kids', data: trending),
                        TrendingSection(),
                        const SizedBox(height: 15),
                        OthersSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ]
          ],
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
      homeProvider.loadData();
    } else {
      refreshLimitDialog(context: context);
    }
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      HomeProvider homeProvider =
          Provider.of<HomeProvider>(context, listen: false);
      if (!homeProvider.isSuccess) homeProvider.loadData();
    });
  }
}
