import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/helpCenter/componnent/body.dart';
import 'package:shop_app/size_config.dart';

class HelpCenterScreen extends StatelessWidget {
  static String routeName = "/help_center";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help Center",
          style: headingStyle.copyWith(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
            horizontal: getProportionateScreenWidth(10)),
        children: [
          HelpCenterBody(),
          HelpCenterBody(),
          HelpCenterBody(),
        ],
      ),
    );
  }
}
