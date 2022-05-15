import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';

class AccountInfoCardDisplay extends StatelessWidget {
  const AccountInfoCardDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510,
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
          AccountInfoChild(title: 'First Name', value: 'YourName'),
          AccountInfoChild(title: 'Last Name', value: 'YourName'),
          AccountInfoChild(title: 'Email', value: 'YourName'),
          AccountInfoChild(title: 'Mobile', value: 'YourName'),
        ],
      ),
    );
  }
}

class AccountInfoChild extends StatelessWidget {
  const AccountInfoChild({
    this.title,
    this.value,
    Key? key,
  }) : super(key: key);
  final String? title;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(title ?? '--'),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          padding: const EdgeInsets.only(top: 0, bottom: 10, left: 0, right: 10),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: HexColor('#F9FAFB'),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SizedBox(),
        ),
      ],
    );
  }
}
