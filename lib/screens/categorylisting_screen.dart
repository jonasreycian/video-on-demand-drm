import 'package:aq_prime/screens/categories_screen.dart';
import 'package:aq_prime/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as flutterbloc;
import 'package:flutter/material.dart';
import 'package:aq_prime/cubits/cubits.dart';
import 'package:aq_prime/data/data.dart';
import 'package:aq_prime/widgets/widgets.dart';
import 'package:aq_prime/widgets/trending_section.dart';
import 'package:transition/transition.dart';

class CategoryListingScreen extends StatefulWidget {
  const CategoryListingScreen({Key? key}) : super(key: key);

  @override
  _CategoryListingScreenState createState() => _CategoryListingScreenState();
}

class _CategoryListingScreenState extends State<CategoryListingScreen> {
  FocusNode _focus = FocusNode();
  // ignore: unused_field
  TextEditingController _controller = TextEditingController();
  bool isSearchbarFocused = false;
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.blue,
    Colors.cyan,
    Colors.orange
  ];
  List<String> genre = [
    "Anime",
    "Action",
    "Drama",
    "Adventure",
    "Korean",
    "Blockbuster",
    "Filipino"
  ];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        context.read<AppBarCubit>().setOffset(_scrollController.offset);
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => print('Cast'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      Transition(
                          child: SearchScreen(),
                          transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Browse All",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 10),
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: (1 / 0.5),
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(colors.length, (index) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Card(
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        color: colors[index],
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              genre[index],
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
            ContentList(
              key: PageStorageKey('myList'),
              title: 'Top 10 List',
              contentList: myList,
            ),
            SizedBox(height: 20),
            ContentList(
              key: PageStorageKey('myList2'),
              title: 'Top 10 List',
              contentList: myList,
            ),
          ]),
        ),
      ),
    );
  }
}
