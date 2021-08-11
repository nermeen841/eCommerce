import 'package:flutter/material.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/authnitication/sign_up/sign_up_screen.dart';
import '../constants.dart';
import '../size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocalKeys.NOTHAVEACCOUNT.tr(),
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            LocalKeys.SIGNUP.tr(),
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
