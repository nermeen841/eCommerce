import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/add_address/componnent/body.dart';
import 'package:easy_localization/easy_localization.dart';

class AddNewAddress extends StatelessWidget {
  static String routeName = "/add_address";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalKeys.ADDNEWADDRESS.tr(),
          style: headingStyle.copyWith(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: AddressFormBody(),
    );
  }
}
