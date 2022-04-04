import 'package:flutter/material.dart';

class AccessibilityCard extends StatelessWidget {
  const AccessibilityCard({
    Key? key,
    required this.accessibility,
  }) : super(key: key);

  final String accessibility;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(54, 54, 54, 1),
      ),
      child: Text(
        accessibility,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
