import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/login_provider.dart';
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
          ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
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
        ),
      ),
    );
  }
}
