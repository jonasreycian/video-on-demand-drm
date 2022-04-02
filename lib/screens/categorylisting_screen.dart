import 'package:flutter/material.dart';

class CategoryListingScreen extends StatefulWidget {
  const CategoryListingScreen({Key? key}) : super(key: key);

  @override
  _CategoryListingScreenState createState() => _CategoryListingScreenState();
}

class _CategoryListingScreenState extends State<CategoryListingScreen> {
  FocusNode _focus = FocusNode();
  bool isSearchbarFocused = false;
  List<Color> colors = [Colors.red, Colors.green, Colors.yellow, Colors.pink, Colors.blue, Colors.cyan, Colors.orange];
  List<String> genre = ["Anime", "Action", "Drama", "Adventure", "Korean", "Blockbuster", "Filipino"];

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget searchIcon() {
    if (isSearchbarFocused) {
      return Icon(
        Icons.close,
        color: Color.fromRGBO(105, 105, 105, 1),
      );
    } else {
      return Icon(
        Icons.search,
        color: Color.fromRGBO(105, 105, 105, 1),
      );
    }
  }

  void _onFocusChange() {
    if (isSearchbarFocused) {
      setState(() {
        isSearchbarFocused = false;
      });
    } else {
      setState(() {
        isSearchbarFocused = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(5.0),
                children: <Widget>[
                  Container(
                    height: 36,
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(38, 38, 38, 1),
                    ),
                    child: TextField(
                      onChanged: (content) {},
                      style: TextStyle(color: Colors.white),
                      focusNode: _focus,
                      decoration: InputDecoration(
                        prefixIcon: searchIcon(),
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Color.fromRGBO(125, 125, 125, 1)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20),
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
                    margin: EdgeInsets.only(top: 20),
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) => Card(
                        child: Center(child: Image.network('https://source.unsplash.com/random', fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Featured",
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

                  // Container(
                  //    margin: EdgeInsets.only(top: 20),
                  //    height: MediaQuery.of(context).size.height * 0.65,
                  //    width: MediaQuery.of(context).size.width,
                  //    child:  GridView.count(
                  //       primary: false,
                  //       crossAxisCount: 2,
                  //       childAspectRatio: (1 / 0.5),
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       children: List.generate(12, (index) {
                  //          return Center(
                  //             child: Container(
                  //                width: MediaQuery.of(context).size.width * 0.47,
                  //                child: Card(
                  //                   semanticContainer: true,
                  //                   shape: RoundedRectangleBorder(
                  //                      borderRadius: BorderRadius.circular(5.0),
                  //                   ),
                  //                   clipBehavior: Clip.antiAlias,
                  //                   color: Colors.red,
                  //                   child: Image.network('https://source.unsplash.com/random',fit: BoxFit.fill)
                  //                ),
                  //             ),
                  //          );
                  //       }
                  //    ),
                  // ),
                  // ),
                ],
              ))),
    );
  }
}
