import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/input_textfield.dart';

class Registration extends StatelessWidget {
  Registration({Key? key}) : super(key: key);
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
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
          child: SingleChildScrollView(
            child: Container(
              height: 750,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.black54,
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
                  const SizedBox(height: 25),
                  InputTextField(
                    controller: firstName,
                    hintText: 'First Name',
                    height: 55,
                    keyboardType: TextInputType.text,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: lastName,
                    hintText: 'Last Name',
                    height: 55,
                    keyboardType: TextInputType.text,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: email,
                    hintText: 'E-mail',
                    height: 55,
                    keyboardType: TextInputType.text,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: mobileNumber,
                    hintText: 'Mobile Number',
                    height: 55,
                    keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: password,
                    hintText: 'Passwords',
                    height: 55,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: confirmPassword,
                    hintText: 'Confirm Password',
                    height: 55,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
