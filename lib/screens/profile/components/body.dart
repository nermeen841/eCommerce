import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/AboutUs/aboutUsScreen.dart';
import 'package:shop_app/screens/Notification/notificationScreen.dart';
import 'package:shop_app/screens/UserAddress/userAddress.dart';
import 'package:shop_app/screens/helpCenter/help_center_screen.dart';
import 'package:shop_app/screens/my_account/my_accountScreen.dart';
import 'package:shop_app/screens/order/order_screen.dart';
import 'package:shop_app/screens/setting_screen/setting_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  String message;

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: LocalKeys.MYACCOUNT.tr(),
            icon: "assets/icons/User Icon.svg",
            press: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyAccountScreen())),
          ),
          ProfileMenu(
            text: LocalKeys.MYORDERS.tr(),
            icon: "assets/icons/shopping-bag.svg",
            press: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderScreen())),
          ),
          ProfileMenu(
            text: LocalKeys.MYADDRESS.tr(),
            icon: "assets/icons/map.svg",
            press: () {
              homeBottomSheet(
                  context: context,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(20),
                        horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 200,
                            color: Theme.of(context).primaryColor,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/images/emptyAddress.jpg",
                              fit: BoxFit.fitHeight,
                            )),
                        spaceH(20),
                        DefaultButton(
                          text: LocalKeys.ADDNEWADDRESS.tr(),
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserAddressScreen())),
                        )
                      ],
                    ),
                  ));
            },
          ),
          ProfileMenu(
            text: LocalKeys.NOTIFICATION.tr(),
            icon: "assets/icons/Bell.svg",
            press: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationScreen())),
          ),
          ProfileMenu(
              text: LocalKeys.SETTING.tr(),
              icon: "assets/icons/Settings.svg",
              press: () =>
                  homeBottomSheet(context: context, child: SettingScreen())
              // Navigator.pushNamed(context, SettingScreen.routeName),
              ),
          ProfileMenu(
            text: LocalKeys.CONTACTUS.tr(),
            icon: "assets/icons/Call.svg",
            press: () {
              homeBottomSheet(
                  context: context,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildMessageFormField(),
                              spaceH(20),
                              DefaultButton(
                                text: LocalKeys.SUBMIT.tr(),
                                press: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    // if all are valid then go to success screen
                                    KeyboardUtil.hideKeyboard(context);
                                  }
                                },
                              ),
                            ],
                          )),
                    ),
                  ));
            },
          ),
          ProfileMenu(
            text: LocalKeys.HELPCENTER.tr(),
            icon: "assets/icons/Question mark.svg",
            press: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HelpCenterScreen())),
          ),
          ProfileMenu(
            text: LocalKeys.ABOUTUS.tr(),
            icon: "assets/icons/Question mark.svg",
            press: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutUsScreen())),
          ),
          ProfileMenu(
            text: LocalKeys.LOGOUT.tr(),
            icon: "assets/icons/Log out.svg",
            press: () async {
              SharedPreferences _sp = await SharedPreferences.getInstance();
              _sp.clear();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyCustomSplashScreen()));
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildMessageFormField() {
    return TextFormField(
      textAlign: TextAlign.start,
      maxLines: 4,
      obscureText: false,
      onSaved: (newValue) => message = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kMessageErrorval);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kMessageErrorval);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocalKeys.MESSAGELABEL.tr(),
        hintText: LocalKeys.MESSAGEHINT.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
