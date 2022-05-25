import 'package:flutter/material.dart';

class MTRCBRating extends StatelessWidget {
  final String? rating;

  MTRCBRating({this.rating = '0'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 29,
      height: 29,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        rating!,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
