import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/single_order/componnent/body.dart';
import 'componnent/sliver_appbar.dart';

class SingleOrderScreen extends StatelessWidget {
  static String routeName = "/single_order";
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
          return <Widget>[SliverAppbar()];
        },
        body: SingleorderBody(),
      ),
    );
  }
}
