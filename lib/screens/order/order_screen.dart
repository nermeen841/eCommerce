import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/order/componnent/body.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = "/Order_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocalKeys.MYORDERS.tr(),
          style: headingStyle.copyWith(fontSize: 16),
        ),
      ),
      body: OrderBody(),
    );
  }
}
