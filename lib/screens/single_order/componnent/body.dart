import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:easy_localization/easy_localization.dart';

class SingleorderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimelineTile(
          alignment: TimelineAlign.start,
          afterLineStyle: LineStyle(color: kPrimaryColor),
          lineXY: .3,
          isFirst: true,
          indicatorStyle: IndicatorStyle(
            width: 30,
            height: 30,
            indicator: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: SvgPicture.asset(
                  "assets/icons/Bell.svg",
                  fit: BoxFit.contain,
                  color: Theme.of(context).cardColor,
                )),
            color: Theme.of(context).cardColor,
          ),
          endChild: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            constraints: const BoxConstraints(
              minHeight: 50,
            ),
            child: Container(child: Text(LocalKeys.ORDERTAKEN.tr())),
          ),
        ),
        // spaceH(30),
        TimelineTile(
          alignment: TimelineAlign.start,
          afterLineStyle: LineStyle(color: kPrimaryColor),
          beforeLineStyle: LineStyle(color: kPrimaryColor),
          lineXY: .3,
          indicatorStyle: IndicatorStyle(
            width: 30,
            height: 30,
            indicator: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: SvgPicture.asset(
                  "assets/icons/Bell.svg",
                  fit: BoxFit.contain,
                  color: Theme.of(context).cardColor,
                )),
            color: Theme.of(context).primaryColor,
          ),
          endChild: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            constraints: const BoxConstraints(
              minHeight: 50,
            ),
            child: Container(child: Text(LocalKeys.PREPAREORDER.tr())),
          ),
        ),
        // spaceH(30),
        TimelineTile(
          alignment: TimelineAlign.start,
          beforeLineStyle: LineStyle(color: kPrimaryColor),
          lineXY: .3,
          indicatorStyle: IndicatorStyle(
            width: 30,
            height: 30,
            indicator: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: SvgPicture.asset(
                  "assets/icons/Bell.svg",
                  fit: BoxFit.contain,
                  color: Theme.of(context).cardColor,
                )),
            color: Theme.of(context).primaryColor,
          ),
          endChild: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            constraints: const BoxConstraints(
              minHeight: 50,
            ),
            child: Container(child: Text(LocalKeys.ORDERDELIVER.tr())),
          ),
        ),

        TimelineTile(
          alignment: TimelineAlign.start,
          beforeLineStyle: LineStyle(color: kPrimaryColor),
          lineXY: .3,
          isLast: true,
          indicatorStyle: IndicatorStyle(
            width: 30,
            height: 30,
            indicator: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: SvgPicture.asset(
                  "assets/icons/Bell.svg",
                  fit: BoxFit.contain,
                  color: Theme.of(context).cardColor,
                )),
            color: Theme.of(context).primaryColor,
          ),
          endChild: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            constraints: const BoxConstraints(
              minHeight: 50,
            ),
            child: Container(child: Text(LocalKeys.ORDERRECIEVE.tr())),
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          width: 350,
          height: 200,
          child: Image.asset(
            "assets/images/mapgoogle.jpg",
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
