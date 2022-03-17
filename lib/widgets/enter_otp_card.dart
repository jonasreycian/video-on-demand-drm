import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/providers/forgot_password_provider.dart';
import 'package:flutter_netflix_responsive_ui/utilities/dialog.dart';
import 'package:flutter_netflix_responsive_ui/widgets/primary_button.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

class EnterOtpCard extends StatelessWidget {
  EnterOtpCard({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordProvider>(builder: (context, value, child) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        if (value.isSuccess) {
          print('success');
          generalDialog(context: context, message: value.message, isAutoClose: true, isLoading: !value.isSuccess);
          // Navigator.of(context).pushReplacementNamed(NavScreen.routeName);
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
            textInputAction: TextInputAction.go,
            enabled: true,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.characters,
            onSubmit: (pin) {
              debugPrint('submit pin:$pin');
            },
            onChanged: (pin) {
              debugPrint('onChanged execute. pin:$pin');
            },
            enableInteractiveSelection: false,
          ),
          const SizedBox(height: 30),
          PrimaryButton(
            label: 'Submit OTP',
            width: double.infinity,
            height: 50,
            action: () {
              // if (emailNumber.text.isNotEmpty) {
              //   value.sendAPI(emailNumber.text);
              //   emailNumberFocus.unfocus();
              //   generalDialog(
              //     context: context,
              //     message: value.message,
              //     isAutoClose: true,
              //     isLoading: true,
              //   );
              // } else {
              //   generalDialog(
              //     context: context,
              //     message: 'Please Enter Mobile Number',
              //     isAutoClose: true,
              //     isLoading: false,
              //   );
              // }
            },
          ),
        ],
      );
    });
  }
}
