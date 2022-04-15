import 'package:aq_prime/providers/account_info_provider.dart';
import 'package:aq_prime/widgets/account_info_card.dart';
import 'package:aq_prime/widgets/plant_details.dart';
import 'package:aq_prime/widgets/title_text_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({
    Key? key,
  }) : super(key: key);
  final TextEditingController firstName = TextEditingController(text: '');
  final TextEditingController lastName = TextEditingController(text: 'Dela Cruz');
  final TextEditingController email = TextEditingController(text: 'juanDela_crus@gmail.com');
  final TextEditingController mobileNumber = TextEditingController(text: '91643489');
  final TextEditingController password = TextEditingController(text: 'passwordMatch');
  final TextEditingController confirmPassword = TextEditingController(text: 'passwordMatch');
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
            : Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(color: Colors.red, strokeWidth: 2.5),
                    ),
                  ),
                ),
              );
      }),
    );
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      AccountInfoProvider accountInfoProvider = Provider.of<AccountInfoProvider>(context, listen: false);
      if (!accountInfoProvider.isSuccess) accountInfoProvider.loadData();
    });
  }
}
