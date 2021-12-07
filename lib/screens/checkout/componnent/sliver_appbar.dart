import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app/generated/local_keys.dart';

class CheckoutSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      elevation: 0.0,
      expandedHeight: 100,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/Back ICon.svg",
                          width: 20,
                          height: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      LocalKeys.CHECKOUT.tr(),
                      textAlign: TextAlign.center,
                      style: headingStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/icons/shopping-bag.svg",
                      width: 30,
                      height: 30,
                      color: Colors.white,
                    ),
                  ),
                ]),
          ),
        );
      }),
    );
  }
}
