import 'package:aq_prime/utilities/hex_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimeSliverAppBar extends StatelessWidget {
  PrimeSliverAppBar({
    Key? key,
    required this.container,
    this.drawer,
    this.bottom,
    this.backgroundImage = 'assets/images/my-record.png',
    required this.title,
    this.appBarContainer,
    this.floatingActionButton,
    this.tabNumber = 1,
    this.expandedHeight = 350,
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
                        elevation: 3,
                        floating: false,
                        pinned: true,
                        flexibleSpace: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            top = constraints.biggest.height;
                            scrolled = (top == navBarHeight);
                            return FlexibleSpaceBar(
                              background: AnimatedContainer(
                                duration: const Duration(milliseconds: 50),
                                child: Column(
                                  children: [
                                    !isImageUrl
                                        ? Hero(
                                            tag: heroTag,
                                            transitionOnUserGestures: true,
                                            child: Image.asset(
                                              backgroundImage!,
                                              height: 300,
                                              width: double.infinity,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              Image.network(
                                                backgroundImage!,
                                                height: 300,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              )
                                            ],
                                          ),
                                    Visibility(
                                      visible: appBarContainer != null,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 10),
                                          appBarContainer!,
                                          const SizedBox(height: 15),
                                        ],
                                      ),
                                    )
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
                        title: Center(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: HexColor('#006B83'),
                            ),
                          ),
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
