import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/authnitication/forgot_password/newPassword/newPassword.dart';
import 'package:shop_app/screens/profile/components/profile_menu.dart';
import 'package:shop_app/screens/setting_screen/componnent/select_country_city.dart';
import 'package:shop_app/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingBody extends StatefulWidget {
  @override
  _SettingBodyState createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  String selectedVal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
            horizontal: getProportionateScreenWidth(10)),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocalKeys.SETTING.tr(),
                  style: headingStyle,
                ),
                spaceH(20),
                Center(
                  child: ProfileMenu(
                    text: LocalKeys.EDITPASSWORD.tr(),
                    icon: "assets/icons/Lock.svg",
                    press: () =>
                        Navigator.pushNamed(context, NewPassword.routeName),
                  ),
                ),
                Center(
                  child: ProfileMenu(
                    text: LocalKeys.CHANGELANGUAGE.tr(),
                    icon: "assets/icons/language.svg",
                    press: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(LocalKeys.CHANGELANG.tr()),
                          content: Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: const Color(0xFFFFFF),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(32.0)),
                            ),
                            child: StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      RadioListTile(
                                          activeColor: kPrimaryColor,
                                          title: Text("عربي"),
                                          value: "عربي",
                                          groupValue: selectedVal,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedVal = value;
                                              selectedVal = value;
                                              // ignore: deprecated_member_use
                                              context.locale = Locale("ar");
                                            });
                                            Navigator.pop(context);
                                          }),
                                      RadioListTile(
                                          activeColor: kPrimaryColor,
                                          title: Text("English"),
                                          value: "English",
                                          groupValue: selectedVal,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedVal = value;
                                              selectedVal = value;
                                              // ignore: deprecated_member_use
                                              context.locale = Locale("en");
                                            });
                                            Navigator.pop(context);
                                          }),
                                    ]);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                spaceH(20),
                SelectCountry(),
                spaceH(20),
                DefaultButton(
                  text: LocalKeys.SAVECHANGES.tr(),
                  press: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
