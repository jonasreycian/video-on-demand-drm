import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';

class AccountInfoChild extends StatelessWidget {
  const AccountInfoChild({
    this.title,
    this.value,
    Key? key,
    this.labelStyle = const TextStyle(color: Colors.black),
  }) : super(key: key);
  final String? title;
  final String? value;
  final TextStyle labelStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(
          title ?? '--',
          style: labelStyle,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 3),
          padding: const EdgeInsets.only(left: 20, top: 8, bottom: 5),
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: HexColor('#F9FAFB'),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            value ?? '--',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
