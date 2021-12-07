import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class SliverAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0.0,
      pinned: true,
      expandedHeight: 100,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      title: Text(
        LocalKeys.DELIVERYSTATUS.tr(),
        style: headingStyle.copyWith(color: Colors.white),
      ),
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      // flexibleSpace: LayoutBuilder(builder: (context, constraints) {
      //   return Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      //     child: Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //         Padding(
      //           padding: const EdgeInsets.only(top: 10),
      //           child: InkWell(
      //             onTap: () {},
      //             child: Container(
      //               padding: EdgeInsets.only(left: 10, right: 10),
      //               decoration: BoxDecoration(
      //                   color: Theme.of(context).primaryColor,
      //                   borderRadius: BorderRadius.circular(20)),
      //               child: Row(
      //                 children: [
      //                   (applang() == "en")
      //                       ? SvgPicture.asset(
      //                           "assets/icons/Back ICon.svg",
      //                           width: 20,
      //                           height: 20,
      //                           color: Theme.of(context).cardColor,
      //                         )
      //                       : SvgPicture.asset(
      //                           "assets/icons/arrow_right.svg",
      //                           width: 20,
      //                           height: 20,
      //                           color: Theme.of(context).cardColor,
      //                         ),
      //                   spaceW(5),
      //                   Text(LocalKeys.GOBACK.tr()),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //         spaceW(10),
      //         Text(
      //           LocalKeys.DELIVERYSTATUS.tr(),
      //           textAlign: TextAlign.center,
      //           style: headingStyle.copyWith(color: Colors.white),
      //         ),
      //       ]),
      //     ),
      //   );
      // }),
    );
  }
}
