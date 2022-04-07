import 'package:aq_prime/providers/search_provider.dart';
import 'package:aq_prime/utilities/dialog.dart';
import 'package:aq_prime/widgets/input_textfield.dart';
import 'package:aq_prime/widgets/subtext_card.dart';
import 'package:aq_prime/widgets/title_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  static const routeName = '/searchScreen';
  final TextEditingController searchField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: 'Search'),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back)),
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
                    controller: searchField,
                    hintText: '',
                    height: 45,
                    keyboardType: TextInputType.text,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    padding: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
                    suffixIconPadding: const EdgeInsets.only(bottom: 15, right: 5),
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
                  itemCount: value.searchData.isNotEmpty ? value.searchData.length : value.data.length,
                  itemBuilder: (context, index) {
                    return SearchCard(
                      index: index,
                      title: value.searchData.isNotEmpty ? value.searchData[index].name! : value.data[index].name!,
                      imageUrl: value.searchData.isNotEmpty ? value.searchData[index].imageUrl! : value.data[index].imageUrl!,
                      runTime: value.searchData.isNotEmpty ? value.searchData[index].runTime! : value.data[index].runTime!,
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
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    required this.index,
    required this.title,
    required this.runTime,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final int index;
  final String title;
  final Duration runTime;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
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
                        child: Image.asset(imageUrl, fit: BoxFit.fitHeight, height: 80),
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
                        '${(index + 1)}. $title',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Subtext(text: netflixDurationFormat(runTime), color: Color.fromRGBO(140, 140, 140, 1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
