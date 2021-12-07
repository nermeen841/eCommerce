import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/ads_pannar.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/screens/home/components/home_sections.dart';
import 'package:shop_app/components/user_location_container.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenHeight(20)),
          UserLocationBar(),
          SizedBox(height: getProportionateScreenWidth(10)),
          AdsBannarScreen(),
          SizedBox(height: getProportionateScreenWidth(30)),
          // DiscountBanner(),
          Categories(),
          SpecialOffers(),
          SizedBox(height: getProportionateScreenWidth(30)),
          PopularProducts(),
          SizedBox(height: getProportionateScreenWidth(30)),
          HomeSectionScreen(),
        ],
      ),
    );
  }
}
