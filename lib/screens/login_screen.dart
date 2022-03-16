import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/login_provider.dart';
import 'package:flutter_netflix_responsive_ui/screens/nav_screen.dart';
import 'package:flutter_netflix_responsive_ui/screens/registration_screen.dart';
import 'package:flutter_netflix_responsive_ui/utilities/dialog.dart';
import 'package:flutter_netflix_responsive_ui/utilities/hex_color.dart';
import 'package:flutter_netflix_responsive_ui/widgets/input_textfield.dart';
import 'package:flutter_netflix_responsive_ui/widgets/primary_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  final TextEditingController emailNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FocusNode passwordFocus = FocusNode();
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
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Consumer<LoginProvider>(builder: (context, value, child) {
                Future.delayed(const Duration(milliseconds: 100), () {
                  if (!value.isLoading) {
                    generalDialog(context: context, message: value.message, isAutoClose: true, isLoading: value.isSuccess);
                    value.reset();
                  }
                });
                Future.delayed(const Duration(milliseconds: 2000), () {
                  if (value.isSuccess) {
                    Navigator.of(context).pushReplacementNamed(NavScreen.routeName);
                    value.reset();
                  }
                });
                return Column(
                  children: [
                    Image.asset(
                      'assets/images/netflixLogo.png',
                      height: 150,
                      width: 150,
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
                    const SizedBox(height: 25),
                    InputTextField(
                      focusNode: passwordFocus,
                      controller: password,
                      hintText: 'Password',
                      height: 55,
                      keyboardType: TextInputType.text,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      suffixIconPadding: const EdgeInsets.only(top: 1, bottom: 10, right: 10),
                      obscureText: value.passwordObscure,
                      suffixIcon: IconButton(
                        onPressed: () => value.setPasswordObscure(),
                        icon: Icon(
                          value.passwordObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: HexColor('#BEBBBB'),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    PrimaryButton(
                      label: 'Login',
                      width: double.infinity,
                      height: 50,
                      action: () {
                        if (emailNumber.text.isNotEmpty && password.text.isNotEmpty) {
                          value.sendAPI(emailNumber.text, password.text);
                          passwordFocus.unfocus();
                          emailNumberFocus.unfocus();
                          generalDialog(
                            context: context,
                            message: value.message,
                            isAutoClose: true,
                            isLoading: true,
                          );
                        } else {
                          generalDialog(
                            context: context,
                            message: 'Please Fill-out all fields',
                            isAutoClose: true,
                            isLoading: false,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(Registration.routeName),
                          child: const Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 13,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
