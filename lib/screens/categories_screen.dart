import 'package:aq_prime/widgets/fetured_section.dart';
import 'package:aq_prime/widgets/only_aqprime_section.dart';
import 'package:aq_prime/widgets/others_section.dart';
import 'package:aq_prime/widgets/popular_section.dart';
import 'package:aq_prime/widgets/top_ten_section.dart';
import 'package:aq_prime/widgets/trending_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/categoriesScreen';
  final Duration duration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    final String? categoryName = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(categoryName ?? ''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              OnlyAQprimeSection(),
              const SizedBox(height: 15),
              PopularSection(),
              const SizedBox(height: 15),
              TrendingSection(),
              const SizedBox(height: 15),
              TopTenSection(),
              const SizedBox(height: 15),
              OthersSection(),
            ],
          ),
        ),
      ),
    );
  }
}
