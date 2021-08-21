import 'package:flutter/material.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'alReadyHaveAccount.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text(
                  LocalKeys.SIGNUPTITLE.tr(),
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  LocalKeys.COMPLETEPROFILEINTRO.tr(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),

                SizedBox(height: getProportionateScreenHeight(20)),
                AlreadyHaveAccount(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/images/apple.svg",
                      press: () {},
                    ),
                  ],
                ),

                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  LocalKeys.CONDITIONAGREE.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
