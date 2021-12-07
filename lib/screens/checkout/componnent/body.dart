import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/UserAddress/card_Address.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/single_order/single_order.dart';
import 'package:shop_app/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class CheckoutBody extends StatefulWidget {
  @override
  _CheckoutBodyState createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  String selectedVal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(10),
              horizontal: getProportionateScreenWidth(10)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  LocalKeys.DELIVERYADDRESS.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 16),
                ),
                spaceH(10),
                AddressCard(),
                spaceH(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/icons/Bill Icon.svg"),
                    spaceW(10),
                    Text(LocalKeys.PAYMENTMETHODE.tr()),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile(
                        title: Text(
                          LocalKeys.CASH.tr(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        activeColor: kPrimaryColor,
                        value: LocalKeys.CASH.tr(),
                        groupValue: selectedVal,
                        onChanged: (value) {
                          setState(() {
                            selectedVal = value;
                          });
                        }),
                    RadioListTile(
                        title: Text(
                          LocalKeys.PAYMENTONLINE.tr(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        activeColor: kPrimaryColor,
                        value: LocalKeys.PAYMENTONLINE.tr(),
                        groupValue: selectedVal,
                        onChanged: (value) {
                          setState(() {
                            selectedVal = value;
                          });
                        }),
                  ],
                ),
                spaceH(20),
                Text(
                  LocalKeys.ORDERINFO.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 16),
                ),
                Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${LocalKeys.SUBTOTAL.tr()} : "),
                            Text("134.0 EG"),
                          ],
                        ),
                        spaceH(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discount : ",
                              style: TextStyle(color: HexColor("#AB0D03")),
                            ),
                            Text("0.0 EG",
                                style: TextStyle(color: HexColor("#AB0D03"))),
                          ],
                        ),
                        spaceH(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${LocalKeys.SHIPPINGCOST.tr()} : "),
                            Text("0.0 EG"),
                          ],
                        ),
                        spaceH(10),
                        Divider(
                          color: Colors.grey,
                        ),
                        spaceH(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${LocalKeys.TOTAL.tr()} : ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "134.0 EG",
                              style: headingStyle.copyWith(
                                  fontSize: 14, color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                spaceH(30),
                DefaultButton(
                  text: LocalKeys.CONFIRM.tr(),
                  press: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Theme.of(context).primaryColor,
                        content: Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(32.0)),
                          ),
                          child: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/success.png"),
                                    Center(
                                      child: Text(
                                        LocalKeys.ORDERSUCCESS.tr(),
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(fontSize: 16),
                                      ),
                                    ),
                                    spaceH(10),
                                    Center(
                                      child: Text(
                                        LocalKeys.ORDERSUCCESSmessage.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        maxLines: 2,
                                      ),
                                    ),
                                    spaceH(10),
                                    DefaultButton(
                                      text: LocalKeys.TRACKORDER.tr(),
                                      press: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SingleOrderScreen())),
                                    ),
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen())),
                                        child: Text(LocalKeys.BACKTOHOME.tr()))
                                  ]);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  //   showDialog<void>(
                  // context: context,
                  // builder: (BuildContext context) {
                  //   return AlertDialog(
                  //     backgroundColor: Theme.of(context).primaryColor,
                  //     content: Container(
                  //       decoration: new BoxDecoration(
                  //         shape: BoxShape.rectangle,
                  //         color: Theme.of(context).primaryColor,
                  //         borderRadius:
                  //             new BorderRadius.all(new Radius.circular(32.0)),
                  //       ),
                  //       child: StatefulBuilder(
                  //         builder:
                  //             (BuildContext context, StateSetter setState) {
                  //           return Column(
                  //               mainAxisSize: MainAxisSize.min,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Align(
                  //                   alignment: Alignment.topLeft,
                  //                   child: InkWell(
                  //                     onTap: () => Navigator.pop(context),
                  //                     child: SvgPicture.asset(
                  //                       "assets/icons/Close.svg",
                  //                       height: 20,
                  //                       width: 20,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 spaceH(20),
                  //                 Image.asset(
                  //                     "assets/icons/WhatsApp Image 2021-08-05 at 4.00.02 PM.jpeg"),
                  //                 Text(
                  //                   LocalKeys.ORDERFAILED.tr(),
                  //                   style: Theme.of(context)
                  //                       .textTheme
                  //                       .bodyText1
                  //                       .copyWith(fontSize: 16),
                  //                 ),
                  //                 spaceH(10),
                  //                 Text(
                  //                   LocalKeys.ORDERFAILEDMESS.tr(),
                  //                   style:
                  //                       Theme.of(context).textTheme.bodyText1,
                  //                 ),
                  //                 spaceH(10),
                  //                 DefaultButton(
                  //                   text: LocalKeys.PLEASETRYAGAIN.tr(),
                  //                   press: () {},
                  //                 ),
                  //                 TextButton(
                  //                     onPressed: () => Navigator.pushNamed(
                  //                         context, HomeScreen.routeName),
                  //                     child: Text(LocalKeys.BACKTOHOME.tr()))
                  //               ]);
                  //         },
                  //       ),
                  //     ),
                  //   );
                  // },
                  // ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
