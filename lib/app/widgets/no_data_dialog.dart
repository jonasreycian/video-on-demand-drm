import 'package:flutter/material.dart';

import 'title_text_card.dart';

class AQNoData extends StatelessWidget {
  const AQNoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: TitleTextCard(
            name: 'No Available Data, Try again later.',
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
