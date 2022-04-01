import 'package:aq_prime/utilities/hex_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AqPrimeSliverAppBar extends StatelessWidget {
  AqPrimeSliverAppBar({
    Key? key,
    required this.container,
    this.drawer,
    this.bottom,
    this.backgroundImage = 'assets/images/my-record.png',
    required this.title,
    this.appBarContainer,
    this.floatingActionButton,
    this.tabNumber = 1,
    this.expandedHeight = 400,
    this.isImageUrl = false,
    this.heroTag = '',
  }) : super(key: key);

  final Widget container;
  final Widget? drawer;
  final Widget? bottom;
  final Widget? appBarContainer;
  final Widget? floatingActionButton;
  final String? backgroundImage;
  final String title;
  final double expandedHeight;
  final int tabNumber;
  final bool isImageUrl;
  final String heroTag;

  var top = 0.0;
  bool scrolled = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var navBarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          child: Scaffold(
            key: _key,
            drawer: drawer,
            body: DefaultTabController(
              length: tabNumber,
              child: Container(
                color: Colors.black,
                child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        expandedHeight: expandedHeight,
                        elevation: 0,
                        floating: false,
                        pinned: true,
                        flexibleSpace: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            top = constraints.biggest.height;
                            scrolled = (top == navBarHeight);
                            return FlexibleSpaceBar(
                              title: Center(
                                child: Text(
                                  scrolled ? title : '',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20,
                                    color: scrolled ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                              centerTitle: true,
                              titlePadding: scrolled ? EdgeInsets.only(top: 45) : EdgeInsets.only(bottom: 65),
                              background: AnimatedContainer(
                                duration: const Duration(milliseconds: 50),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    !isImageUrl
                                        ? Hero(
                                            tag: heroTag,
                                            transitionOnUserGestures: true,
                                            child: Image.asset(
                                              backgroundImage!,
                                              width: double.infinity,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                        : Hero(
                                            tag: heroTag,
                                            transitionOnUserGestures: true,
                                            child: Image.network(
                                              backgroundImage!,
                                              height: 300,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
                                          ),
                                    Positioned(
                                      bottom: 200,
                                      child: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 500),
                                        child: !scrolled
                                            ? IconButton(
                                                iconSize: 65,
                                                alignment: Alignment.center,
                                                tooltip: 'Play',
                                                onPressed: () {},
                                                icon: Icon(Icons.play_circle),
                                                color: Color.fromRGBO(209, 52, 53, 1),
                                              )
                                            : const SizedBox(),
                                      ),
                                    ),
                                    Positioned(
                                      child: Visibility(
                                        visible: appBarContainer != null && !scrolled,
                                        child: appBarContainer!,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        backgroundColor: Colors.black,
                        iconTheme: IconThemeData(
                          color: Colors.red, //change your color here
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight((bottom != null) ? 40.0 : 0.0),
                          child: (bottom != null)
                              ? Container(
                                  color: HexColor('#DBF9FF'),
                                  child: bottom!,
                                )
                              : Container(),
                        ),
                      ),
                    ];
                  },
                  body: SafeArea(top: false, child: container),
                ),
              ),
            ),
            floatingActionButton: floatingActionButton,
          ),
          data: MediaQuery.of(context).copyWith(textScaleFactor: 0.95),
        );
      },
    );
  }
}
