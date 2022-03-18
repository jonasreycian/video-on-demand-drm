import 'package:flutter/material.dart';
import 'package:aq_prime/providers/forgot_password_provider.dart';
import 'package:aq_prime/utilities/dialog.dart';
import 'package:aq_prime/widgets/primary_button.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

class EnterOtpCard extends StatelessWidget {
  EnterOtpCard({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordProvider>(builder: (context, value, child) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (value.isSuccess) {
          generalDialog(context: context, message: value.message, isAutoClose: true, isLoading: !value.isSuccess, icon: Icons.check);
          value.reset();
        }
      });
      return Column(
        children: [
          Image.asset(
            'assets/images/SampleLogo.png',
            height: 130,
            width: 130,
          ),
          const SizedBox(height: 25),
          PinInputTextField(
            pinLength: 4,
            decoration: UnderlineDecoration(
              colorBuilder: PinListenColorBuilder(Colors.red, Colors.white),
              bgColorBuilder: null,
              textStyle: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            controller: controller,
            focusNode: focusNode,
            textInputAction: TextInputAction.go,
            enabled: true,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.characters,
            onSubmit: (pin) {
              debugPrint('submit pin:$pin');
            },
            enableInteractiveSelection: false,
          ),
          const SizedBox(height: 30),
          PrimaryButton(
            label: 'Submit OTP',
            width: double.infinity,
            height: 50,
            action: () {
              if (controller.text.isNotEmpty) {
                value.sendOTP(controller.text);
                focusNode.unfocus();
              } else {
                generalDialog(
                  context: context,
                  message: 'Please Enter OTP.',
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