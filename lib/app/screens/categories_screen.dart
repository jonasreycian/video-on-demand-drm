import 'package:flutter/material.dart';

import '../widgets/fetured_section.dart';
import '../widgets/only_aqprime_section.dart';
import '../widgets/others_section.dart';
import '../widgets/popular_section.dart';
import '../widgets/search_button.dart';
import '../widgets/title_text_card.dart';
import '../widgets/top_ten_section.dart';
import '../widgets/trending_section.dart';
import 'search_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/categoriesScreen';

  @override
  Widget build(BuildContext context) {
    final String? categoryName =
        ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: categoryName ?? ''),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back)),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FeaturedSection(),
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
