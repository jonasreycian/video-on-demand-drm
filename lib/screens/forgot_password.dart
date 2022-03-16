import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/input_textfield.dart';
import 'package:flutter_netflix_responsive_ui/widgets/primary_button.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  static const routeName = '/forgotPassword';
  final TextEditingController emailNumber = TextEditingController();
  final FocusNode emailNumberFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 500,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/SampleLogo.png',
                    height: 130,
                    width: 130,
                  ),
                  const SizedBox(height: 25),
                  InputTextField(
                    focusNode: emailNumberFocus,
                    controller: emailNumber,
                    hintText: 'Email / Mobile Number',
                    height: 55,
                    keyboardType: TextInputType.text,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    label: 'Reset Password',
                    width: double.infinity,
                    height: 50,
                    action: () {},
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
