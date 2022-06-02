import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/title_text_card.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  static const routeName = '/subscriptionScreen';
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool plan1Selected = false;
  bool plan2Selected = false;

  Widget buildTextWithSub(String title, String sub) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(sub,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 2,
            )),
      ],
    );
  }

  Widget buildItem(
      {required String name,
      required int price,
      bool selected = false,
      Function(bool? value)? onCheckChange}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextWithSub(name, 'P$price/mo'),
            ],
          ),
        ),
        Checkbox(
          value: selected,
          onChanged: onCheckChange,
          activeColor: Colors.red,
          shape: CircleBorder(),
          side: BorderSide(
            color: Colors.white,
            width: 1,
          ),
          checkColor: Colors.red,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(
          name: 'Change Plan',
          icon: Image.asset(
            'assets/images/AQ_PRIME_LOGO_2.png',
            width: 48,
            height: 48,
          ),
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 32),
        height: 400,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: Color.fromARGB(255, 12, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plan Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 34),
            Row(
              children: [
                Text(
                  'AQ Prime',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 52),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/phone@3x.png',
                        color: HexColor('#C4C4C4'),
                        width: 24,
                        height: 24,
                      ),
                      Image.asset(
                        'assets/images/phone_horizontal@3x.png',
                        color: HexColor('#C4C4C4'),
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildItem(
                    name: 'Monthly Subscription',
                    price: 99,
                    selected: plan1Selected,
                    onCheckChange: (value) {
                      setState(() {
                        plan1Selected = !plan1Selected;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  buildItem(
                    name: 'Semi-Annual Subscription',
                    price: 549,
                    selected: plan2Selected,
                    onCheckChange: (value) {
                      setState(() {
                        plan2Selected = !plan2Selected;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                  Text(
                    '*No annual subscription',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButton(
              label: 'Change Plan',
              height: 50,
              action: () {},
            )
          ],
        ),
      ),
    );
  }
}
