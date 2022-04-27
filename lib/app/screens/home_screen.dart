import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../data/extra/data.dart';
import '../widgets/aq_floating_action_button.dart';
import '../widgets/fetured_section.dart';
import '../widgets/only_aqprime_section.dart';
import '../widgets/others_section.dart';
import '../widgets/popular_section.dart';
import '../widgets/search_button.dart';
import '../widgets/section_card.dart';
import '../widgets/title_text_card.dart';
import '../widgets/top_ten_section.dart';
import '../widgets/trending_section.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
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
              SectionCard(titleSection: 'New Releases', data: combine()),
              const SizedBox(height: 15),
              SectionCard(titleSection: 'My Watch List', data: trending),
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
    );
  }
}
