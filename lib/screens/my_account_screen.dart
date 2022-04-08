import 'package:aq_prime/widgets/account_info_card.dart';
import 'package:aq_prime/widgets/plant_details.dart';
import 'package:aq_prime/widgets/title_text_card.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TitleTextCard(name: 'My Account'),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: Padding(padding: const EdgeInsets.only(left: 10), child: Image.asset('assets/images/AQ_PRIME_LOGO_2.png')),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
