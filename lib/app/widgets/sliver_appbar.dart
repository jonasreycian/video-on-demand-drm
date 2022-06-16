import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/video_details_provider.dart';

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
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        expandedHeight: expandedHeight,
                        elevation: 0,
                        floating: false,
                        pinned: true,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Provider.of<VideoDetailsProvider>(context,
                                    listen: false)
                                .reset();
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        flexibleSpace: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
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
                                  alignment: Alignment.center,
                                  children: [
                                    FadeInImage.assetNetwork(
                                      width: double.infinity,
                                      fadeInCurve: Curves.easeInQuart,
                                      fadeOutCurve: Curves.easeInQuart,
                                      fadeOutDuration:
                                          const Duration(milliseconds: 1000),
                                      fadeInDuration:
                                          const Duration(milliseconds: 200),
                                      fit: BoxFit.cover,
                                      placeholderFit: BoxFit.contain,
                                      placeholderScale: 15,
                                      placeholder:
                                          'assets/images/loadingSmall.gif',
                                      image: backgroundImage!,
                                    ),
                                    Positioned(
                                      child: appBarContainer!,
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
                          preferredSize:
                              Size.fromHeight((bottom != null) ? 40.0 : 0.0),
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
