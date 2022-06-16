import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../cubits/app_bar/app_bar_cubit.dart';
import '../providers/my_watch_list_provider.dart';
import '../widgets/responsive.dart';
import 'category_listing_screen.dart';
import 'continue_watching_screen.dart';
import 'home_screen.dart';
import 'my_account_screen.dart';
import 'my_watch_list_screen.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
  static const routeName = '/Home';
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListingScreen(),
    MyWatchListScreen(),
    ContinueWatchingScreen(),
    MyAccountScreen(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Categories': Icons.apps,
    'My Watch List': Icons.queue_play_next,
    'Continue \nWatching': Icons.play_arrow,
    'My Account': Icons.account_circle_rounded,
  };

  int _currentIndex = 0; //currentTab

  void initializeAPI(BuildContext context) {
    if (_currentIndex == 0) {
      Provider.of<MyWatchListProvider>(context, listen: false)
          .loadWatchList(); //sa home tab lang sir
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeAPI(context);
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: _icons
                  .map(
                    (title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                        icon: Icon(icon, size: 30.0),
                        label: title,
                      ),
                    ),
                  )
                  .values
                  .toList(),
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11.0,
              onTap: (index) => setState(() => _currentIndex = index),
            )
          : null,
    );
  }
}
