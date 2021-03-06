import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/utils/utils.dart';
import '../../device/utils/dialog.dart';
import '../../domain/entities/category.dart';
import '../providers/category_listing_provider.dart';
import '../providers/featured_provider.dart';
import '../providers/refresh_limiter.dart';
import '../widgets/aq_floating_action_button.dart';
import '../widgets/category_card.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/search_button.dart';
import '../widgets/section_card.dart';
import '../widgets/title_text_card.dart';
import 'search_screen.dart';

class CategoryListingScreen extends StatelessWidget {
  CategoryListingScreen({Key? key}) : super(key: key);
  final List<Category> category_1 = [];
  final List<Category> category_2 = [];

  void splitArray(Iterable<Category> source) {
    if (source.isEmpty) return;
    category_1.clear();
    category_2.clear();
    double firstHalf = 6;
    double secondHalf = source.length - firstHalf;
    List.generate(
      6.toInt(),
      ((index) {
        category_1.add(source.elementAt(index));
      }),
    );
    List.generate(
      secondHalf.toInt(),
      ((index) {
        category_2.add(source.elementAt(index + firstHalf.toInt()));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    initState(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: 'Categories'),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/images/AQ_PRIME_LOGO_2.png')),
        actions: [
          SearchButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SearchScreen.routeName),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      floatingActionButton: AqFloatingActionButton(
        onPressed: () {},
      ),
      body: Consumer<CategoryListingProvider>(
        builder: (context, value, child) {
          splitArray(value.data);
          return value.isSuccess
              ? SafeArea(
                  child: RefreshIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.red,
                    onRefresh: () => Future.delayed(
                      const Duration(milliseconds: 100),
                      () => onRefresh(context),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            height: 300,
                            width: double.infinity,
                            child: GridView.count(
                              primary: false,
                              crossAxisCount: 2,
                              childAspectRatio: (1 / 0.5),
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(
                                category_1.length,
                                (index) {
                                  return CategoryCard(
                                    index: index,
                                    color: Utils.generateRandomColor(),
                                    category: category_1[index],
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Consumer<FeaturedProvider>(
                            builder: (context, value, child) {
                              return value.data.isEmpty
                                  ? Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    )
                                  : SectionCard(
                                      titleSection: 'Featured',
                                      contents: value.data,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                    );
                            },
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            height: 400,
                            width: double.infinity,
                            child: GridView.count(
                              primary: false,
                              crossAxisCount: 2,
                              childAspectRatio: (1 / 0.5),
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(
                                category_2.length,
                                (index) {
                                  return CategoryCard(
                                    index: index,
                                    color: Utils.generateRandomColor(),
                                    category: category_2[index],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : AQLoadingIndicator();
        },
      ),
    );
  }

  onRefresh(context) {
    RefreshLimit refreshLimit =
        Provider.of<RefreshLimit>(context, listen: false);
    CategoryListingProvider categoryListingProvider =
        Provider.of<CategoryListingProvider>(context, listen: false);
    if (refreshLimit.onLimit) {
      refreshLimit.setCount();
      categoryListingProvider.loadData();
    } else {
      refreshLimitDialog(context: context);
    }
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      CategoryListingProvider categoryListingProvider =
          Provider.of<CategoryListingProvider>(context, listen: false);
      if (!categoryListingProvider.isSuccess) {
        categoryListingProvider.loadData();
      }

      FeaturedProvider featuredProvider =
          Provider.of<FeaturedProvider>(context, listen: false);
      if (!featuredProvider.isSuccess) featuredProvider.loadData();
    });
  }
}
