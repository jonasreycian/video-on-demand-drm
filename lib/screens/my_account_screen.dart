import 'package:aq_prime/widgets/account_info_card.dart';
import 'package:aq_prime/widgets/plant_details.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('My Account'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AccountInfoCard(),
              PlanDetailsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
