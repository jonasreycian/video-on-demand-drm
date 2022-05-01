import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/extra/data.dart';
import '../../device/utils/dialog.dart';
import '../providers/category_listing_provider.dart';
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

  final List<Color> colors = [Colors.red, Colors.green, Colors.yellow, Colors.pink, Colors.blue, Colors.cyan];
  final List<String> genre = ["Anime", "Action", "Drama", "Adventure", "Korean", "Blockbuster"];

  @override
  Widget build(BuildContext context) {
    initState(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: 'Categories'),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading:
            Padding(padding: const EdgeInsets.only(left: 10), child: Image.asset('assets/images/AQ_PRIME_LOGO_2.png')),
        actions: [
          SearchButton(onPressed: () => Navigator.of(context).pushNamed(SearchScreen.routeName)),
        ],
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      floatingActionButton: AqFloatingActionButton(onPressed: () {}),
      body: Consumer<CategoryListingProvider>(builder: (context, value, child) {
        return value.isSuccess
            ? SafeArea(
                child: RefreshIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.red,
                  onRefresh: () => Future.delayed(const Duration(milliseconds: 100), () => onRefresh(context)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Browse All',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 10),
                          height: 300,
                          width: double.infinity,
                          child: GridView.count(
                            primary: false,
                            crossAxisCount: 2,
                            childAspectRatio: (1 / 0.5),
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(
                              colors.length,
                              (index) {
                                return CategoryCard(
                                  index: index,
                                  color: colors[index],
                                  genre: '1st Category\n' + genre[index] + ' ${(index + 1)}',
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SectionCard(titleSection: 'Featured', data: trending),
                        const SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 10),
                          height: 400,
                          width: double.infinity,
                          child: GridView.count(
                            primary: false,
                            crossAxisCount: 2,
                            childAspectRatio: (1 / 0.5),
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(
                              colors.length,
                              (index) {
                                return CategoryCard(
                                  index: colors.length + index,
                                  color: colors[index],
                                  genre: '2nd Category\n' + genre[index] + ' ${(index + 1)}',
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
      }),
    );
  }

  onRefresh(context) {
    RefreshLimit refreshLimit = Provider.of<RefreshLimit>(context, listen: false);
    CategoryListingProvider categoryListingProvider = Provider.of<CategoryListingProvider>(context, listen: false);
    if (refreshLimit.onLimit) {
      refreshLimit.setCount();
      categoryListingProvider.loadData();
    } else {
      refreshLimitDialog(context: context);
    }
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      CategoryListingProvider categoryListingProvider = Provider.of<CategoryListingProvider>(context, listen: false);
      if (!categoryListingProvider.isSuccess) categoryListingProvider.loadData();
    });
  }
}
