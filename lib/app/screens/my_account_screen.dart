import 'package:aq_prime/app/providers/account_info_provider.dart';
import 'package:aq_prime/app/widgets/account_info_card.dart';
import 'package:aq_prime/app/widgets/loading_indicator.dart';
import 'package:aq_prime/app/widgets/plant_details.dart';
import 'package:aq_prime/app/widgets/title_text_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/account_info_provider.dart';
import '../widgets/account_info_card.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/plant_details.dart';
import '../widgets/title_text_card.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({
    Key? key,
  }) : super(key: key);
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    initState(context);
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
      body: Consumer<AccountInfoProvider>(builder: (context, value, child) {
        firstName.text = value.firstName ?? '';
        lastName.text = value.lastName ?? '';
        email.text = value.email ?? '';
        mobileNumber.text = value.mobile ?? '';
        return value.isSuccess
            ? SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AccountInfoCard(
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                        mobileNumber: mobileNumber,
                      ),
                      PlanDetailsCard(plan: value.plan),
                    ],
                  ),
                ),
              )
            : AQLoadingIndicator();
      }),
    );
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      AccountInfoProvider accountInfoProvider = Provider.of<AccountInfoProvider>(context, listen: false);
      if (!accountInfoProvider.isSuccess) accountInfoProvider.loadData();
    });
  }
}
