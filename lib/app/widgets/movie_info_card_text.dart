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
    return Container(
      height: 70,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 19,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
