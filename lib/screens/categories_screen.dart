import 'package:aq_prime/data/data.dart';
import 'package:aq_prime/widgets/fetured_section.dart';
import 'package:aq_prime/widgets/only_aqprime_section.dart';
import 'package:aq_prime/widgets/popular_section.dart';
import 'package:aq_prime/widgets/top_ten_card.dart';
import 'package:aq_prime/widgets/top_ten_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CatergoriesScreen extends StatelessWidget {
  const CatergoriesScreen({
    Key? key,
  }) : super(key: key);
  final Duration duration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text('Categories'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              AnimationConfiguration.staggeredList(
                position: 0,
                duration: duration,
                child: FadeInAnimation(
                  child: SlideAnimation(
                    verticalOffset: 100,
                    child: FeaturedSection(),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TopTenSection(),
              const SizedBox(height: 15),
              PopularSection(),
              const SizedBox(height: 15),
              OnlyAQprimeSection(),
              const SizedBox(height: 15),
              TrendingSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingSection extends StatelessWidget {
  const TrendingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Trending',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 180,
          color: Colors.transparent,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: (context, index) {
              return TopTenCard(
                title: trending[index].name!,
                imageUrl: trending[index].imageUrl!,
              );
            },
          ),
        ),
      ],
    );
  }
}
