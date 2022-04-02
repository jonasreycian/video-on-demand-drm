import 'package:aq_prime/widgets/subtext_card.dart';
import 'package:flutter/material.dart';

class IconButtonWithName extends StatelessWidget {
  const IconButtonWithName({
    required this.title,
    required this.iconData,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData iconData;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 65,
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            iconSize: 35,
            onPressed: onPressed,
            icon: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          Subtext(text: title)
        ],
      ),
    );
  }
}
