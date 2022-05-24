import 'package:aq_prime/app/providers/category_contents_provider.dart';
import 'package:aq_prime/app/widgets/thumbnail_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/search_button.dart';
import '../widgets/title_text_card.dart';
import 'search_screen.dart';

class CategoryContentsScreen extends StatelessWidget {
  const CategoryContentsScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/categoryContentScreen';

  void initState(BuildContext context, String slug) {
    Future.delayed(const Duration(milliseconds: 1), () {
      CategoryContentsProvider categoryListingProvider = Provider.of<CategoryContentsProvider>(context, listen: false);
      if (!categoryListingProvider.isSuccess) categoryListingProvider.loadData(slug);
    });
  }

  Widget _buildError() {
    return Center(
      child: Text('Invalid category'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? categoryName = ModalRoute.of(context)!.settings.arguments as String?;

    if (categoryName == null || categoryName.isEmpty) return _buildError();

    initState(context, categoryName);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: categoryName),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          SearchButton(
            onPressed: () => Navigator.of(context).pushNamed(SearchScreen.routeName),
          ),
        ],
      ),
      body: Consumer<CategoryContentsProvider>(
        builder: (context, value, child) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            child: GridView.builder(
              primary: true,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // childAspectRatio: 1.2,
                mainAxisExtent: 180,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: value.data.contents.length,
              itemBuilder: (context, index) => ThumbnailCard(
                index: index,
                imageUrl: value.data.contents[index].coverPhotoMobile,
                // title: value.data.contents[index].title,
              ),
            ),
          );
        },
      ),
    );
  }
}
