import 'package:aq_prime/app/widgets/thumbnail_movie_card.dart';
import 'package:flutter/material.dart';

import '../widgets/search_button.dart';
import '../widgets/title_text_card.dart';
import 'search_screen.dart';

class CategoryContentsScreen extends StatelessWidget {
  const CategoryContentsScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/categoriesScreen';

  @override
  Widget build(BuildContext context) {
    final String? categoryName =
        ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: GridView.builder(
          primary: true,
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 170,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) => ThumbnailCard(
            index: index,
            imageUrl: '',
            title: '',
          ),
        ),
      ),
    );
  }
}
