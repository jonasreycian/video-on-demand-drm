import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/registration_provider.dart';
import 'package:flutter_netflix_responsive_ui/screens/nav_screen.dart';
import 'package:flutter_netflix_responsive_ui/screens/registration_screen.dart';
import 'package:flutter_netflix_responsive_ui/widgets/dismiss_keyboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<RegistrationProvider>(create: (context) => RegistrationProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Netflix UI',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.black,
          ),
          home: Registration(),
          routes: {
            NavScreen.routeName: (context) => NavScreen(),
          },
        ),
      ),
    );
  }
}
