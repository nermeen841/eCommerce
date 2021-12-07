import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/cart/components/vouncher_market.dart';
import 'package:shop_app/screens/checkout/check_out.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: getProportionateScreenWidth(40),
                    width: getProportionateScreenWidth(40),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset("assets/icons/receipt.svg"),
                  ),
                  Spacer(),
                  Text(LocalKeys.VOUNCHERCODRE.tr()),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kTextColor,
                  )
                ],
              ),
              onTap: () {
                homeBottomSheet(context: context, child: VouncherMarket());
              },
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${LocalKeys.TOTAL.tr()}:",
                    ),
                    Text("\$337.15",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 16,
                            )),
                  ],
                ),
                SizedBox(
                  width: getProportionateScreenWidth(400),
                  child: DefaultButton(
                    text: LocalKeys.CHECKOUT.tr(),
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutScreen())),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
