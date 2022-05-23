import 'package:aq_prime/app/providers/home_provider.dart';
import 'package:aq_prime/app/providers/refresh_limiter.dart';
import 'package:aq_prime/app/screens/search_screen.dart';
import 'package:aq_prime/app/widgets/aq_floating_action_button.dart';
import 'package:aq_prime/app/widgets/fetured_section.dart';
import 'package:aq_prime/app/widgets/loading_indicator.dart';
import 'package:aq_prime/app/widgets/no_data_dialog.dart';
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
        leading: Padding(padding: const EdgeInsets.only(left: 10), child: Image.asset('assets/images/AQ_PRIME_LOGO_2.png')),
        actions: [
          SearchButton(onPressed: () => Navigator.of(context).pushNamed(SearchScreen.routeName)),
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
                  onRefresh: () => Future.delayed(const Duration(milliseconds: 100), () => onRefresh(context)),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FeaturedSection(featuredList: value.isFeaturedData),
                        SizedBox(
                          height: (300 * value.data.length).toDouble(),
                          child: ListView.builder(
                            padding: const EdgeInsets.only(top: 0, bottom: 0),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: value.data.length,
                            itemBuilder: (context, index) {
                              return SectionCard(
                                titleSection: value.data[index]['name'],
                                contents: value.data[index]['contents'],
                              );
                            },
                          ),
                        ),
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
    RefreshLimit refreshLimit = Provider.of<RefreshLimit>(context, listen: false);
    HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);
    if (refreshLimit.onLimit) {
      refreshLimit.setCount();
      homeProvider.loadData();
    } else {
      refreshLimitDialog(context: context);
    }
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);
      if (!homeProvider.isSuccess) homeProvider.loadData();
    });
  }
}
