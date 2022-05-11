import 'package:flutter/material.dart';
import 'package:aq_prime/providers/login_provider.dart';
import 'package:aq_prime/screens/forgot_password_screen.dart';
import 'package:aq_prime/screens/nav_screen.dart';
import 'package:aq_prime/screens/registration_screen.dart';
import 'package:aq_prime/utilities/dialog.dart';
import 'package:aq_prime/utilities/hex_color.dart';
import 'package:aq_prime/widgets/input_textfield.dart';
import 'package:aq_prime/widgets/primary_button.dart';
import 'package:aq_prime/widgets/text_and_link.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  // final TextEditingController emailNumber = TextEditingController(text: 'demo@test.com');
  // final TextEditingController password = TextEditingController(text: 'pass123\$');
  final TextEditingController emailNumber =
      TextEditingController(text: 'hardknockrabbit@gmail.com');
  final TextEditingController password =
      TextEditingController(text: 'pass123\$');
  //   final TextEditingController emailNumber = TextEditingController();
  // final TextEditingController password = TextEditingController();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode emailNumberFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Center(
          child: AnimationConfiguration.staggeredList(
            position: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              layoutBuilder: (widget, animation) {
                return FadeInAnimation(
                  duration: const Duration(milliseconds: 500),
                  child: widget!,
                  delay: const Duration(milliseconds: 100),
                );
              },
              child: SingleChildScrollView(
                child: Container(
                  height: 450,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child:
                      Consumer<LoginProvider>(builder: (context, value, child) {
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      if (!value.isLoading && !value.isSuccess) {
                        Navigator.of(context).pop();
                        value.reset();
                      }
                      if (!value.isLoading && value.isSuccess) {
                        Navigator.of(context)
                          ..pop()
                          ..pushReplacementNamed(NavScreen.routeName);
                        value.reset();
                      }
                    });
                    return Column(
                      children: [
                        Image.asset(
                          'assets/images/AQ_PRIME_LOGO_2.png',
                          height: 130,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 25),
                        InputTextField(
                          focusNode: emailNumberFocus,
                          controller: emailNumber,
                          hintText: 'Email / Mobile Number',
                          height: 55,
                          keyboardType: TextInputType.text,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                        ),
                        const SizedBox(height: 25),
                        InputTextField(
                          focusNode: passwordFocus,
                          controller: password,
                          hintText: 'Password',
                          height: 55,
                          keyboardType: TextInputType.text,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                          suffixIconPadding: const EdgeInsets.only(
                              top: 1, bottom: 10, right: 10),
                          obscureText: value.passwordObscure,
                          suffixIcon: IconButton(
                            onPressed: () => value.setPasswordObscure(),
                            icon: Icon(
                              value.passwordObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: HexColor('#BEBBBB'),
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextAndLink(
                          text: 'Forgot Password?',
                          link: 'Tap here',
                          onTap: () => Navigator.of(context)
                              .pushNamed(ForgotPasswordScreen.routeName),
                        ),
                        const SizedBox(height: 15),
                        PrimaryButton(
                          label: 'Login',
                          width: double.infinity,
                          height: 50,
                          action: () {
                            if (emailNumber.text.isNotEmpty &&
                                password.text.isNotEmpty) {
                              value.sendAPI(emailNumber.text, password.text);
                              passwordFocus.unfocus();
                              emailNumberFocus.unfocus();
                              loginDialog(context);
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
                        const SizedBox(height: 15),
                        TextAndLink(
                          text: 'Don\'t have account?',
                          link: 'Register Here',
                          onTap: () => Navigator.of(context)
                              .pushNamed(RegistrationScreen.routeName),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  loginDialog(context) {
    showGeneralDialog(
      barrierDismissible: false,
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;

        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: anim1.value,
            child: AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              contentPadding: const EdgeInsets.all(15),
              actionsPadding: const EdgeInsets.only(bottom: 10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              backgroundColor: Colors.black87,
              content: AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.transparent,
                child:
                    Consumer<LoginProvider>(builder: (context, value, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          value.message ?? 'Please Wait...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      value.isLoading || value.isSuccess
                          ? SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                color: Colors.red,
                                strokeWidth: 2.5,
                              ),
                            )
                          : SizedBox(
                              width: 25,
                              height: 25,
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                    ],
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
