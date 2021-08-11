import 'package:flutter/material.dart';
import 'package:shop_app/screens/checkout/componnent/body.dart';
import 'package:shop_app/screens/checkout/componnent/sliver_appbar.dart';

import '../../constants.dart';

class CheckoutScreen extends StatelessWidget {
  static String routeName = "/checkout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[CheckoutSliver()];
        },
        body: CheckoutBody(),
      ),
    );
  }
}
