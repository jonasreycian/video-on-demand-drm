import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/forgot_password_provider.dart';
import 'package:flutter_netflix_responsive_ui/utilities/dialog.dart';
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
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!value.isLoading && !value.isSuccess) {
          generalDialog(context: context, message: value.message, isAutoClose: true, isLoading: value.isSuccess);
          value.reset();
        }
      });
      // Future.delayed(const Duration(milliseconds: 2000), () {
      //   if (value.isSuccess) {
      //     // print('success');
      //     // Navigator.of(context).pushReplacementNamed(NavScreen.routeName);
      //     value.reset();
      //   }
      // });
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
            height: 45,
            hint: value.selectedWidgetCard,
            choices: value.choices,
            textHintColor: Colors.black,
            onChanged: (selectedChoice) => value.setSelectedWidgetCard(selectedChoice),
          ),
          const SizedBox(height: 20),
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
            label: 'Mail OTP',
            width: double.infinity,
            height: 50,
            action: () {
              if (emailNumber.text.isNotEmpty) {
                value.sendAPI(emailNumber.text);
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
                  message: 'Please Enter Email Address',
                  isAutoClose: true,
                  isLoading: false,
                );
              }
            },
          ),
        ],
      );
    });
  }
}
