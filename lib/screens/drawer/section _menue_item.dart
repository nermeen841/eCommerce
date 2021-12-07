import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';

import '../../constants.dart';

class SectionMenueItem extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback press;
  const SectionMenueItem(
      {Key key,
      @required this.text1,
      @required this.text2,
      @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.lightGreen[100],
      child: ListTile(
          onTap: () {},
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$text1",
                  style: headingStyle.copyWith(
                      color: HexColor("#02446E"),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$text2",
                  style: headingStyle.copyWith(
                      color: kTextColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ])),
    );
  }
}
