import 'package:aq_prime/app/widgets/account_info_child_card.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/secondary_button.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';

class AccountInfoCardDisplay extends StatelessWidget {
  const AccountInfoCardDisplay({
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    required this.onChangeInformation,
    required this.onPressedLogout,
    Key? key,
  }) : super(key: key);
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobileNumber;
  final void Function() onChangeInformation;
  final void Function() onPressedLogout;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
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
          const SizedBox(height: 20),
          AccountInfoChild(title: 'First Name', value: firstName),
          AccountInfoChild(title: 'Last Name', value: lastName),
          AccountInfoChild(title: 'Email', value: email),
          AccountInfoChild(title: 'Mobile', value: mobileNumber),
          const SizedBox(height: 20),
          SecondaryButton(
            height: 50,
            width: double.infinity,
            label: 'Change information',
            action: onChangeInformation,
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            height: 50,
            width: double.infinity,
            label: 'Logout',
            action: onPressedLogout,
          ),
        ],
      ),
    );
  }
}
