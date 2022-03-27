import 'package:flutter/material.dart';

class InfoMovieCardText extends StatelessWidget {
  const InfoMovieCardText({
    required this.type,
    required this.value,
    Key? key,
  }) : super(key: key);
  final String type;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
