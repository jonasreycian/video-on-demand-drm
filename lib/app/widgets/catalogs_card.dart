import 'package:flutter/material.dart';

class Catalogs extends StatelessWidget {
  const Catalogs({
    this.list,
    Key? key,
  }) : super(key: key);
  final List? list;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catalogs',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        if (list != null) ...[
          for (int i = 0; i < list!.length; i++) ...[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              height: 30,
              child: Text(
                '• ${list![i]}',
                softWrap: false,
                textAlign: TextAlign.left,
                maxLines: 2,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ]
      ],
    );
  }
}
