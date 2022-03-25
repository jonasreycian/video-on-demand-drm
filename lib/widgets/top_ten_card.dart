import 'package:flutter/material.dart';

class TopTenCard extends StatelessWidget {
  const TopTenCard({
    required this.title,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          height: 150,
          width: 100,
          margin: const EdgeInsets.only(right: 20),
        ),
        const SizedBox(height: 10),
        Text(
          title.split(" ")[0], //first word
          overflow: TextOverflow.fade,
          softWrap: true,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
