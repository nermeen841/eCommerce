import 'package:flutter/material.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            LocalKeys.YOURCART.tr(),
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} ${LocalKeys.ITEMS.tr()}",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
