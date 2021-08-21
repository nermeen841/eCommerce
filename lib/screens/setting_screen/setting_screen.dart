import 'package:flutter/material.dart';
import 'package:shop_app/screens/setting_screen/componnent/body.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = "/setting_screen";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: SettingBody(),
    );
  }
}
