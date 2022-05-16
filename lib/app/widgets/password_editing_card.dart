import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PasswordEditingCard extends StatefulWidget {
  const PasswordEditingCard({Key? key}) : super(key: key);

  @override
  State<PasswordEditingCard> createState() => _PasswordEditingCardState();
}

class _PasswordEditingCardState extends State<PasswordEditingCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 100,
          child: AnimatedContainer(
            margin: const EdgeInsets.only(top: 25, bottom: 5, left: 25, right: 25),
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                childrenPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 0),
                tilePadding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                expandedAlignment: Alignment.centerLeft,
                onExpansionChanged: (value) {
                  isExpanded = value;
                  setState(() {});
                },
                trailing: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  child: Icon(Icons.arrow_drop_down, color: Colors.white),
                ),
                title: Text(
                  'Change Password',
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                children: [
                  Divider(
                    color: Colors.red,
                    thickness: 1.5,
                  ),
                  const SizedBox(
                    height: 450,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
