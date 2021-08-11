import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/size_config.dart';

class AboutusBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: ListView(
        primary: true,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(20),
            horizontal: getProportionateScreenHeight(20)),
        children: [
          Image.asset("assets/images/Image Banner 2.png"),
          spaceH(20),
          Text(
              "You can find your all needs in this application \n all product you need are here "),
          spaceH(20),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SocalCard(
                  icon: "assets/icons/facebook-2.svg",
                  press: () {},
                ),
                SocalCard(
                  icon: "assets/icons/google-icon.svg",
                  press: () {},
                ),
                SocalCard(
                  icon: "assets/images/apple.svg",
                  press: () {},
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
