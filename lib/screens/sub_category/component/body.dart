import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';

import 'package:shop_app/screens/sub_category/component/subCategory_slider.dart';
import 'package:shop_app/screens/sub_category/component/subCategory_tabbar.dart';

import 'brand.dart';

class SubcategoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      children: [
        SubCategorySlider(),
        spaceH(40),
        Brands(),
        spaceH(40),
        SubCategoryTab()
      ],
    );
  }
}
