import 'package:aq_prime/utilities/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class AqPrimeSliverAppBar extends StatelessWidget {
  AqPrimeSliverAppBar({
    Key? key,
    required this.container,
    this.drawer,
    this.bottom,
    required this.backgroundImage,
    required this.title,
    this.appBarContainer,
    this.floatingActionButton,
    this.tabNumber = 1,
    this.expandedHeight = 300,
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
            body: Container(
              color: Colors.black,
              child: DefaultTabController(
                length: tabNumber,
                initialIndex: 0,
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
                            return FlexibleSpaceBar(
                              title: Text(
                                top == 144.0 ? title : '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              centerTitle: true,
                              titlePadding: EdgeInsets.only(top: 0, bottom: 65),
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
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Hero(
                                            tag: heroTag,
                                            transitionOnUserGestures: true,
                                            child: Image.network(
                                              backgroundImage!,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
                                          ),
                                    Positioned(
                                      top: 80,
                                      child: AnimationConfiguration.staggeredList(
                                        position: 0,
                                        duration: const Duration(milliseconds: 1500),
                                        child: FadeInAnimation(
                                          delay: const Duration(milliseconds: 1000),
                                          child: Container(
                                            child: top != 144.0
                                                ? IconButton(
                                                    iconSize: 65,
                                                    alignment: Alignment.center,
                                                    tooltip: 'Play',
                                                    onPressed: () {},
                                                    icon: Icon(Icons.play_circle),
                                                    color: Colors.white,
                                                  )
                                                : const SizedBox(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      child: Visibility(
                                        visible: appBarContainer != null && top != 144.0,
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
                                  color: Colors.black,
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
