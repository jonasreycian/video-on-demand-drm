import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../device/utils/dialog.dart';
import '../providers/search_provider.dart';
import '../widgets/input_textfield.dart';
import '../widgets/subtext_card.dart';
import '../widgets/title_text_card.dart';
import 'video_details/video_details_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  static const routeName = '/searchScreen';
  final TextEditingController searchField = TextEditingController();
  final FocusNode focusSearch = FocusNode();
  @override
  Widget build(BuildContext context) {
    initState(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: 'Search'),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<SearchProvider>(builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InputTextField(
                    focusNode: focusSearch,
                    controller: searchField,
                    hintText: '',
                    height: 45,
                    keyboardType: TextInputType.text,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    padding:
                        const EdgeInsets.only(left: 20, top: 5, bottom: 10),
                    suffixIconPadding:
                        const EdgeInsets.only(bottom: 15, right: 5),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      iconSize: 25,
                      icon: Icon(Icons.search, color: Colors.black),
                    ),
                    onChanged: (string) => value.searched(string),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(top: 10, bottom: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: value.searchData.isNotEmpty
                      ? value.searchData.length
                      : value.data.length,
                  itemBuilder: (context, index) {
                    return SearchCard(
                      index: index,
                      title: value.searchData.isNotEmpty
                          ? value.searchData[index].title!
                          : value.data[index].title!,
                      imageUrl: value.searchData.isNotEmpty
                          ? value.searchData[index].imageUrl!
                          : value.data[index].imageUrl!,
                      runTime: value.searchData.isNotEmpty
                          ? value.searchData[index].runTime!
                          : value.data[index].runTime!,
                      heroTag: value.searchData.isNotEmpty
                          ? 'searchTag${value.searchData[index].imageUrl} $index'
                          : 'searchTag${value.data[index].imageUrl} $index',
                      onTap: () {
                        focusSearch.unfocus();
                        Navigator.of(context)
                            .pushNamed(VideoDetailsPage.routeName, arguments: {
                          'data': value.searchData.isNotEmpty
                              ? value.searchData[index]
                              : value.data[index],
                          'heroTag': value.searchData.isNotEmpty
                              ? 'searchTag${value.searchData[index].imageUrl} $index'
                              : 'searchTag${value.data[index].imageUrl} $index',
                        });
                      },
                    );
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SearchProvider getFeedback =
          Provider.of<SearchProvider>(context, listen: false);
      getFeedback.reset();
    });
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    required this.index,
    required this.title,
    required this.runTime,
    required this.imageUrl,
    required this.heroTag,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final int index;
  final String title;
  final Duration runTime;
  final String imageUrl;
  final String heroTag;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 500),
        child: FadeInAnimation(
          child: SlideAnimation(
            verticalOffset: 20,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              padding: const EdgeInsets.only(left: 10),
              color: Colors.transparent,
              height: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // width: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Hero(
                            child: Image.asset(imageUrl,
                                fit: BoxFit.fitHeight, height: 80),
                            tag: heroTag,
                            transitionOnUserGestures: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Subtext(
                            text: netflixDurationFormat(runTime.inMinutes),
                            color: Color.fromRGBO(140, 140, 140, 1)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
