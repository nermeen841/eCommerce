import 'package:flutter/material.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductFilter extends StatefulWidget {
  @override
  _ProductFilterState createState() => _ProductFilterState();
}

class _ProductFilterState extends State<ProductFilter> {
  List<String> listoffilters = [
    LocalKeys.SORTBY.tr(),
    LocalKeys.COMPITABLE.tr(),
    LocalKeys.RECENTLYARRIVED.tr(),
    LocalKeys.MOSTCOMMON.tr(),
    LocalKeys.TOPRATED.tr(),
    LocalKeys.LOWHIGH.tr(),
    LocalKeys.HIGHLOW.tr()
  ];
  String selectedVal = "";
  // String selectedfilter = LocalKeys.SORTBY.tr();
  // String dropdownScrollable = 'I';
  // String dropdownNames;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          PopupMenuButton(
            color: Colors.white,
            icon: Icon(
              Icons.sort,
            ),
            onSelected: (value) {
              setState(() {
                selectedVal = value;
              });
            },
            itemBuilder: (context) => listoffilters.map((e) {
              return PopupMenuItem(
                value: e,
                child: Text(
                  e,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            }).toList(),
          ),
          Text(
            selectedVal,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            "334 ${LocalKeys.PRODUCTS.tr()}",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
