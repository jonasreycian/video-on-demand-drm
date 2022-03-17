import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/forgot_password_provider.dart';
import 'package:flutter_netflix_responsive_ui/widgets/dropdown_card.dart';
import 'package:flutter_netflix_responsive_ui/widgets/input_textfield.dart';
import 'package:flutter_netflix_responsive_ui/widgets/primary_button.dart';
import 'package:provider/provider.dart';

class ResetPasswordCardEmail extends StatelessWidget {
  ResetPasswordCardEmail({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailNumber = TextEditingController();
  final FocusNode emailNumberFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordProvider>(builder: (context, value, child) {
      return Column(
        children: [
          Image.asset(
            'assets/images/SampleLogo.png',
            height: 130,
            width: 130,
          ),
          const SizedBox(height: 25),
          Dropdown(
            width: double.infinity,
            height: 50,
            hint: value.selectedWidgetCard,
            choices: value.choices,
            textHintColor: Colors.red,
            onChanged: (selectedChoice) => value.setSelectedWidgetCard(selectedChoice),
          ),
          const SizedBox(height: 25),
          InputTextField(
            focusNode: emailNumberFocus,
            controller: emailNumber,
            hintText: value.hintText,
            height: 55,
            keyboardType: value.textInputType,
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
    });
  }
}

class ResetPasswordCardMobile extends StatelessWidget {
  ResetPasswordCardMobile({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailNumber = TextEditingController();
  final FocusNode emailNumberFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/SampleLogo.png',
          height: 130,
          width: 130,
        ),
        const SizedBox(height: 25),
        Dropdown(
          width: double.infinity,
          height: 50,
          hint: 'Reset via',
          choices: ['Reset via Mobile Number', 'Reset via Email'],
          onChanged: (value) {},
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
