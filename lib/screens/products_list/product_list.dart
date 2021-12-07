import 'package:flutter/material.dart';
import 'package:shop_app/screens/products_list/componnent/body.dart';

class ProductListScreen extends StatelessWidget {
  final String title;

  const ProductListScreen({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_off_outlined,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
      body: ProductListBody(),
    );
  }
}
