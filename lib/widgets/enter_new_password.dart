import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/utilities/dialog.dart';
import 'package:flutter_netflix_responsive_ui/utilities/hex_color.dart';
import 'package:flutter_netflix_responsive_ui/widgets/input_textfield.dart';
import 'package:flutter_netflix_responsive_ui/widgets/primary_button.dart';

class EnterNewPassword extends StatelessWidget {
  EnterNewPassword({Key? key}) : super(key: key);
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
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
        InputTextField(
          controller: password,
          hintText: 'Password',
          height: 55,
          keyboardType: TextInputType.text,
          obscureText: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          padding: const EdgeInsets.only(left: 60, top: 8, bottom: 8),
          suffixIconPadding: const EdgeInsets.only(top: 3, bottom: 10, right: 10),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              true ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: HexColor('#BEBBBB'),
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 20),
        InputTextField(
          controller: confirmPassword,
          hintText: 'Confirm Password',
          height: 55,
          keyboardType: TextInputType.text,
          obscureText: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
          suffixIconPadding: const EdgeInsets.only(top: 3, bottom: 10, right: 10),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              true ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: HexColor('#BEBBBB'),
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 20),
        PrimaryButton(
          height: 50,
          action: () {
            if (password.text.isNotEmpty && confirmPassword.text.isNotEmpty) {
              // value.sendAPI(firstName.text, lastName.text, email.text, mobileNumber.text, password.text, confirmPassword.text);
              // generalDialog(
              //   context: context,
              //   message: value.message,
              //   isAutoClose: true,
              //   isLoading: true,
              // );
            } else {
              generalDialog(
                context: context,
                message: 'Please Fill-out all fields',
                isAutoClose: true,
                isLoading: false,
              );
            }
          },
          width: double.infinity,
          label: 'Change Password',
        ),
      ],
    );
  }
}
