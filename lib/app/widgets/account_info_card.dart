import 'package:aq_prime/app/providers/account_info_provider.dart';
import 'package:aq_prime/app/widgets/input_textfield.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/secondary_button.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../device/utils/hex_color.dart';
import 'input_textfield.dart';
import 'primary_button.dart';
import 'secondary_button.dart';

class AccountInfoCardEditing extends StatelessWidget {
  AccountInfoCardEditing({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.onSaved,
    required this.onCancel,
    Key? key,
  }) : super(key: key);
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController mobileNumber;
  final void Function() onSaved;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    AccountInfoProvider accountInfoProvider = Provider.of<AccountInfoProvider>(context, listen: false);
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 100,
          child: Container(
            height: 515,
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
                  onChanged: (p0) => accountInfoProvider.setFirstName(p0),
                  controller: firstName,
                  hintText: 'First Name',
                  height: 55,
                  keyboardType: TextInputType.text,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                ),
                const SizedBox(height: 20),
                InputTextField(
                  onChanged: (p0) => accountInfoProvider.setLastName(p0),
                  controller: lastName,
                  hintText: 'Last Name',
                  height: 55,
                  keyboardType: TextInputType.text,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                ),
                const SizedBox(height: 20),
                InputTextField(
                  onChanged: (p0) => accountInfoProvider.setEmail(p0),
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
                  onChanged: (p0) => accountInfoProvider.setMobile(p0),
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
                  label: 'Save',
                  action: onSaved,
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  height: 50,
                  width: double.infinity,
                  label: 'Cancel',
                  action: onCancel,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
