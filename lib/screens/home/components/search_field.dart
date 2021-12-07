import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/product_search/searchScreen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(
          context: context,
          delegate: ProductSearch(),
        );
      },
      child: Container(
        width: SizeConfig.screenWidth * 0.4,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(Icons.search_rounded),
            Text(
              LocalKeys.SEARCHHINT.tr(),
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
