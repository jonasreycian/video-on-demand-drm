import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'account_info_child_card.dart';
import 'primary_button.dart';

class AccountInfoCardDisplay extends StatelessWidget {
  const AccountInfoCardDisplay({
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    required this.onChangeInformation,
    required this.onLogout,
    Key? key,
  }) : super(key: key);
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobileNumber;
  final void Function() onChangeInformation;
  final void Function() onLogout;
  @override
  Widget build(BuildContext context) {
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
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Account Information',
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
                AccountInfoChild(
                  title: 'First Name',
                  value: firstName,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                AccountInfoChild(
                  title: 'Last Name',
                  value: lastName,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                AccountInfoChild(
                  title: 'Email',
                  value: email,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                AccountInfoChild(
                  title: 'Mobile',
                  value: mobileNumber,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: onChangeInformation,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Change information',
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center,
                      )),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  height: 50,
                  width: double.infinity,
                  label: 'Logout',
                  action: onLogout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
