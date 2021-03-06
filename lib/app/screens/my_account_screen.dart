import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../device/utils/api_request.dart';
import '../../device/utils/dialog.dart';
import '../../device/utils/user_data.dart' as user_data;
import '../providers/account_info_provider.dart';
import '../providers/refresh_limiter.dart';
import '../widgets/account_info_card.dart';
import '../widgets/account_info_card_display.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/password_editing_card.dart';
import '../widgets/plant_details.dart';
import '../widgets/title_text_card.dart';
import 'login_screen.dart';

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
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset('assets/images/AQ_PRIME_LOGO_2.png'),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Consumer<AccountInfoProvider>(
        builder: (context, value, _child) {
          firstName.text = value.user?.firstName ?? '';
          lastName.text = value.user?.lastName ?? '';
          email.text = value.user?.email ?? '';
          mobileNumber.text = value.user?.mobile ?? '';
          return value.isSuccess
              ? SafeArea(
                  child: RefreshIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.red,
                    onRefresh: () => Future.delayed(
                      const Duration(milliseconds: 100),
                      () => onRefresh(context),
                    ),
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
                                      value.update();
                                      value.setIsEditing();
                                    },
                                  )
                                : AccountInfoCardDisplay(
                                    firstName: value.user?.firstName,
                                    lastName: value.user?.lastName,
                                    email: value.user?.email,
                                    mobileNumber: value.user?.mobile,
                                    onLogout: () {
                                      API().request(
                                          requestType: RequestType.post,
                                          endPoint: '/logout');
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              LoginScreen.routeName);
                                      user_data.loggedOut();
                                    },
                                    onChangeInformation: () {
                                      value.setIsEditing();
                                    },
                                  ),
                          ),
                          const SizedBox(height: 20),
                          value.user != null
                              ? value.user!.plan != null
                                  ? PlanDetailsCard(
                                      plan: value.user!.plan!.toJson(),
                                    )
                                  : const SizedBox()
                              : const SizedBox(),
                          const SizedBox(height: 20),
                          PasswordEditingCard(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                )
              : AQLoadingIndicator();
        },
      ),
    );
  }

  onRefresh(context) {
    RefreshLimit refreshLimit =
        Provider.of<RefreshLimit>(context, listen: false);
    AccountInfoProvider accountInfoProvider =
        Provider.of<AccountInfoProvider>(context, listen: false);
    if (refreshLimit.onLimit) {
      refreshLimit.setCount();
      accountInfoProvider.loadData();
    } else {
      refreshLimitDialog(context: context);
    }
  }

  initState(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      AccountInfoProvider accountInfoProvider =
          Provider.of<AccountInfoProvider>(context, listen: false);
      accountInfoProvider.loadData();
    });
  }
}
