import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/UserAddress/Addresses_body.dart';
import 'package:easy_localization/easy_localization.dart';

class UserAddressScreen extends StatelessWidget {
  static String routeName = "/user_address";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalKeys.MYADDRESS.tr(),
          style:
              headingStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: AddressesBody(),
    );
  }
}
