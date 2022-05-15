import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';

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
          margin: const EdgeInsets.only(top: 5, bottom: 3),
          // padding: const EdgeInsets.only(top: 0, bottom: 10, left: 0, right: 10),
          height: 40,
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
