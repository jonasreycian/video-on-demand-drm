import 'package:aq_prime/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class PlanDetailsCard extends StatelessWidget {
  const PlanDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 10),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Plan Details',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ultra 4K UHD / Premium',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '799 PHP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.only(right: 10), child: Icon(Icons.tv_sharp)),
            ],
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            height: 50,
            action: () {},
            width: double.infinity,
            label: 'Change Plan',
          ),
        ],
      ),
    );
  }
}
