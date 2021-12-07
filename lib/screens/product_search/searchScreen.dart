import 'package:flutter/material.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app/screens/products_list/product_list.dart';

class ProductSearch extends SearchDelegate {
  ProductSearch()
      : super(
            searchFieldLabel: LocalKeys.SEARCHHINT.tr(),
            searchFieldStyle: TextStyle(fontSize: 14, fontFamily: 'Muli'));
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductListScreen(
                          title: "",
                        ))),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "T - shirt",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                )),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductListScreen(
                          title: "",
                        ))),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "T - shirt",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                )),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        });
  }
}
