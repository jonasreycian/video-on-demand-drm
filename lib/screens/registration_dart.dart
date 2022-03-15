import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/input_textfield.dart';

class Registration extends StatelessWidget {
  Registration({Key? key}) : super(key: key);
  final TextEditingController firstName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/netflixLogo.png',
                  height: 150,
                  width: 150,
                ),
                InputTextField(
                  controller: firstName,
                  hintText: 'First Name',
                  height: 55,
                  keyboardType: TextInputType.visiblePassword,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
