import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/constans.dart';

import '../../../../constants.dart';

class AddressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).primaryColor,
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
              children: [
                SvgPicture.asset(
                  "assets/icons/Location point.svg",
                  width: 20,
                  height: 20,
                  color: kPrimaryColor,
                ),
                spaceW(20),
                Text("Borg el-zahraa , Mansoura"),
              ],
            ),
            spaceH(10),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/international-call.svg",
                  width: 20,
                  height: 20,
                  color: kPrimaryColor,
                ),
                spaceW(20),
                Text("01062015106"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
