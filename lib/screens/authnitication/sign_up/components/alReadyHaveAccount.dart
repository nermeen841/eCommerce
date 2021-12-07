import 'package:flutter/material.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/authnitication/sign_in/sign_in_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class AlreadyHaveAccount extends StatefulWidget {
  @override
  _AlreadyHaveAccountState createState() => _AlreadyHaveAccountState();
}

class _AlreadyHaveAccountState extends State<AlreadyHaveAccount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocalKeys.HAVEACCOUNT.tr(),
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignInScreen())),
          child: Text(
            LocalKeys.SIGNIN.tr(),
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
