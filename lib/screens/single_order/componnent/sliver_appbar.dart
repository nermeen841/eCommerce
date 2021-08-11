import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class SliverAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      elevation: 0.0,
      expandedHeight: 120,
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/Back ICon.svg",
                          width: 20,
                          height: 20,
                          color: Colors.black,
                        ),
                        spaceW(10),
                        Text(LocalKeys.GOBACK.tr()),
                      ],
                    ),
                  ),
                ),
              ),
              spaceW(10),
              Text(
                LocalKeys.DELIVERYSTATUS.tr(),
                textAlign: TextAlign.center,
                style: headingStyle.copyWith(color: Colors.white),
              ),
            ]),
          ),
        );
      }),
    );
  }
}
