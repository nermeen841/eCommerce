import 'package:flutter/material.dart';
import 'package:shop_app/screens/products_list/componnent/productList.dart';
import 'package:shop_app/screens/products_list/componnent/product_filter.dart';

class ProductListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      children: [ProductFilter(), ProductListData()],
    );
  }
}
