import 'package:aq_prime/app/providers/account_info_provider.dart';
import 'package:aq_prime/app/providers/refresh_limiter.dart';
import 'package:aq_prime/app/screens/login_screen.dart';
import 'package:aq_prime/app/widgets/account_info_card.dart';
import 'package:aq_prime/app/widgets/account_info_card_display.dart';
import 'package:aq_prime/app/widgets/loading_indicator.dart';
import 'package:aq_prime/app/widgets/password_editing_card.dart';
import 'package:aq_prime/app/widgets/plant_details.dart';
import 'package:aq_prime/app/widgets/primary_button.dart';
import 'package:aq_prime/app/widgets/title_text_card.dart';
import 'package:aq_prime/device/utils/api_request.dart';
import 'package:aq_prime/device/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:aq_prime/device/utils/user_data.dart' as user_data;

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({
    Key? key,
  }) : super(key: key);
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final Duration duration = const Duration(milliseconds: 500);

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
      body: Consumer<AccountInfoProvider>(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              PasswordEditingCard(),
              const SizedBox(height: 20),
              AnimationConfiguration.staggeredList(
                position: 2,
                duration: const Duration(milliseconds: 500),
                child: FadeInAnimation(
                  child: SlideAnimation(
                    verticalOffset: 100,
                    child: PrimaryButton(
                      height: 50,
                      width: double.infinity,
                      label: 'Logout',
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      action: () {
                        API().request(requestType: RequestType.post, endPoint: '/logout');
                        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                        user_data.loggedOut();
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          builder: (context, value, child) {
            firstName.text = value.firstName ?? '';
            lastName.text = value.lastName ?? '';
            email.text = value.email ?? '';
            mobileNumber.text = value.mobile ?? '';
            return value.isSuccess
                ? SafeArea(
                    child: RefreshIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.red,
                      onRefresh: () => Future.delayed(const Duration(milliseconds: 100), () => onRefresh(context)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedSwitcher(
                              duration: duration,
                              child: value.isEditing
                                  ? AccountInfoCardEditing(
                                      firstName: firstName,
                                      lastName: lastName,
                                      email: email,
                                      mobileNumber: mobileNumber,
                                      onSaved: () {
                                        value.setIsEditing();
                                      },
                                    )
                                  : AccountInfoCardDisplay(
                                      firstName: value.firstName,
                                      lastName: value.lastName,
                                      email: value.email,
                                      mobileNumber: value.mobile,
                                      onChangeInformation: () {
                                        value.setIsEditing();
                                      },
                                    ),
                            ),
                            const SizedBox(height: 20),
                            PlanDetailsCard(plan: value.plan),
                            child!,
                          ],
                        ),
                      ),
                    ),
                  )
                : AQLoadingIndicator();
          }),
    );
  }

  onRefresh(context) {
    RefreshLimit refreshLimit = Provider.of<RefreshLimit>(context, listen: false);
    AccountInfoProvider accountInfoProvider = Provider.of<AccountInfoProvider>(context, listen: false);
    if (refreshLimit.onLimit) {
      refreshLimit.setCount();
      accountInfoProvider.loadData(true);
    } else {
      refreshLimitDialog(context: context);
    }
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      AccountInfoProvider accountInfoProvider = Provider.of<AccountInfoProvider>(context, listen: false);
      if (!accountInfoProvider.isSuccess) accountInfoProvider.loadData(false);
    });
  }
}