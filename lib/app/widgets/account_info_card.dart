import 'package:aq_prime/app/screens/login_screen.dart';
import 'package:aq_prime/app/widgets/input_textfield.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/secondary_button.dart';
import 'package:aq_prime/device/utils/api_request.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:aq_prime/device/utils/user_data.dart' as user_data;
import '../../device/utils/api_request.dart';
import '../../device/utils/hex_color.dart';
import '../screens/login_screen.dart';
import 'input_textfield.dart';
import 'primary_button.dart';
import 'secondary_button.dart';

class AccountInfoCard extends StatelessWidget {
  AccountInfoCard({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    Key? key,
  }) : super(key: key);
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController mobileNumber;
  @override
  Widget build(BuildContext context) {
    user_data.loggedOut();
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 100,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Info',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                InputTextField(
                  onChanged: (p0) {},
                  controller: firstName,
                  hintText: 'First Name',
                  height: 55,
                  keyboardType: TextInputType.text,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                ),
                const SizedBox(height: 20),
                InputTextField(
                  onChanged: (p0) {},
                  controller: lastName,
                  hintText: 'Last Name',
                  height: 55,
                  keyboardType: TextInputType.text,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                ),
                const SizedBox(height: 20),
                InputTextField(
                  onChanged: (p0) {},
                  controller: email,
                  hintText: 'E-mail',
                  height: 55,
                  keyboardType: TextInputType.text,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                ),
                // const SizedBox(height: 20),
                // CalendarField(
                //   selectedDate: 'March 11, 1990',
                //   withShadow: true,
                //   isDateRange: false,
                //   function: () => calendarDialog(
                //     context,
                //     DateTime.now(),
                //     (p0) {
                //       Navigator.of(context).pop();
                //     },
                //   ),
                // ),
                const SizedBox(height: 20),
                InputTextField(
                  onChanged: (p0) {},
                  controller: mobileNumber,
                  hintText: 'Mobile Number',
                  height: 55,
                  keyboardType: TextInputType.number,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  prefixIconPadding: const EdgeInsets.only(top: 8, bottom: 10),
                  prefixIcon: GestureDetector(
                    onTap: () {},
                    child: Text('+63', style: TextStyle(fontSize: 15, color: HexColor('#BEBBBB'), fontWeight: FontWeight.w700)),
                  ),
                ),
                // const SizedBox(height: 20),
                // InputTextField(
                //   onChanged: (p0) {},
                //   controller: password,
                //   hintText: 'Password',
                //   height: 55,
                //   keyboardType: TextInputType.text,
                //   obscureText: true,
                //   floatingLabelBehavior: FloatingLabelBehavior.auto,
                //   padding: const EdgeInsets.only(left: 60, top: 8, bottom: 8),
                //   suffixIconPadding: const EdgeInsets.only(top: 3, bottom: 10, right: 10),
                //   suffixIcon: IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       // ignore: dead_code
                //       false ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                //       color: HexColor('#BEBBBB'),
                //       size: 20,
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 20),
                // InputTextField(
                //   onChanged: (p0) {},
                //   controller: confirmPassword,
                //   hintText: 'Confirm Password',
                //   height: 55,
                //   keyboardType: TextInputType.text,
                //   obscureText: false,
                //   floatingLabelBehavior: FloatingLabelBehavior.auto,
                //   padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                //   suffixIconPadding: const EdgeInsets.only(top: 3, bottom: 10, right: 10),
                //   suffixIcon: IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       // ignore: dead_code
                //       false ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                //       color: HexColor('#BEBBBB'),
                //       size: 20,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 20),
                SecondaryButton(
                  height: 50,
                  width: double.infinity,
                  label: 'Change information',
                  action: () {},
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  height: 50,
                  width: double.infinity,
                  label: 'Logout',
                  action: () {
                    API().request(requestType: RequestType.post, endPoint: '/logout');
                    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                    user_data.loggedOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
