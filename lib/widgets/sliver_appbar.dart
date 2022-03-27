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
    this.expandedHeight = 325,
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
                              title: Text(
                                scrolled ? title : '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
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
                                    Positioned(
                                      child: Visibility(
                                        visible: appBarContainer != null,
                                        child: appBarContainer!,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        backgroundColor: Colors.transparent,
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
