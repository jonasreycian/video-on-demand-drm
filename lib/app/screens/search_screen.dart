import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../device/utils/hex_color.dart';
import '../providers/search_provider.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/thumbnail_movie_card.dart';
import '../widgets/title_text_card.dart';
import 'video_details/video_details_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  static const routeName = '/searchScreen';
  final TextEditingController searchField = TextEditingController();
  final FocusNode focusSearch = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: 'Search'),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Consumer<SearchProvider>(builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  focusNode: focusSearch,
                  controller: searchField,
                  expands: false,
                  maxLines: 1,
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusColor: Colors.transparent,
                    suffixIcon: IconButton(
                      onPressed: () {
                        value.search(searchField.text);
                      },
                      iconSize: 24,
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: HexColor('#000000'),
                  ),
                  onEditingComplete: () {
                    print('SHIT');
                  },
                ),
              ),
              const SizedBox(height: 16),
              value.isLoading
                  ? Container(
                      height: 200,
                      width: double.infinity,
                      child: AQLoadingIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 175,
                        ),
                        itemCount: value.data.length,
                        itemBuilder: (context, index) {
                          return ThumbnailCardForGrid(
                            index: index,
                            imageUrl: value.data[index].coverPhotoMobile!,
                            onTap: () => Navigator.of(context).pushNamed(
                              VideoDetailsPage.routeName,
                              arguments: VideoDetailsPageArguments(
                                content: value.data[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }
}
