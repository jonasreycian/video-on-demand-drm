import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 20),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.normal,
          fontSize: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
