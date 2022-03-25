import 'package:aq_prime/data/data.dart';
import 'package:aq_prime/widgets/fetured_section.dart';
import 'package:aq_prime/widgets/only_aqprime_section.dart';
import 'package:aq_prime/widgets/popular_section.dart';
import 'package:aq_prime/widgets/top_ten_card.dart';
import 'package:aq_prime/widgets/top_ten_section.dart';
import 'package:flutter/material.dart';

class CatergoriesScreen extends StatelessWidget {
  const CatergoriesScreen({
    Key? key,
  }) : super(key: key);

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
              FeaturedSection(),
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
    return Container();
  }
}
