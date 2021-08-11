import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/my_account/component/body.dart';
import 'package:easy_localization/easy_localization.dart';

class MyAccountScreen extends StatelessWidget {
  static String routeName = "/my_account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalKeys.MYACCOUNT.tr(),
          style: headingStyle.copyWith(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: MyAccountBody(),
    );
  }
}
