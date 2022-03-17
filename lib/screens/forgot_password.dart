import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/dropdown_card.dart';
import 'package:flutter_netflix_responsive_ui/widgets/input_textfield.dart';
import 'package:flutter_netflix_responsive_ui/widgets/primary_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  static const routeName = '/forgotPassword';

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = ResetPasswordCard();
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
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  layoutBuilder: (widget, animation) {
                    return FadeInAnimation(
                      duration: const Duration(milliseconds: 500),
                      child: widget!,
                      delay: const Duration(milliseconds: 100),
                    );
                  },
                  child: currentWidget,
                )),
          ),
        ),
      ),
    );
  }
}

class ResetPasswordCard extends StatelessWidget {
  ResetPasswordCard({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailNumber = TextEditingController();
  final FocusNode emailNumberFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dropdown(
          hint: 'Reset via',
          choices: ['Mobile Number', 'Email'],
          onChanged: (value) {},
        ),
        const SizedBox(height: 25),
        Image.asset(
          'assets/images/SampleLogo.png',
          height: 130,
          width: 130,
        ),
        const SizedBox(height: 25),
        InputTextField(
          focusNode: emailNumberFocus,
          controller: emailNumber,
          hintText: 'Email',
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
    );
  }
}
