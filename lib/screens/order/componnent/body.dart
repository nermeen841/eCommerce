import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/single_order/single_order.dart';
import 'package:shop_app/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: ListView.separated(
          primary: true,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(10),
              horizontal: getProportionateScreenWidth(10)),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, SingleOrderScreen.routeName),
              child: Card(
                elevation: 2,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  // color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order #45776",
                            style: headingStyle.copyWith(
                                fontSize: 14, color: Colors.blue),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.yellowAccent[200],
                                borderRadius: BorderRadius.circular(5)),
                            child: Text("Requested"),
                          )
                        ],
                      ),
                      spaceH(20),
                      Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue[100],
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                LocalKeys.VIEWDETAIL.tr(),
                                style: headingStyle.copyWith(fontSize: 16),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: 10),
    ));
  }
}
