import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/screens/Notification/component/bodyStyle.dart';
import 'package:shop_app/size_config.dart';

class NotificationBody extends StatefulWidget {
  @override
  _NotificationBodyState createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(20),
              horizontal: getProportionateScreenWidth(20)),
          children: [
            GestureDetector(
              onTap: () async {
                launchInBrowser('https://flutter.dev');
              },
              child: BodyStyle(
                imagePath: "assets/images/Image Banner 2.png",
                title: "Title 1",
                description:
                    "description you can find all product here \n we will provide you with all updates",
                width: 350,
                hieght: 120,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                launchInBrowser('https://flutter.dev');
              },
              child: BodyStyle(
                width: 350,
                hieght: 350,
                imagePath: "assets/images/splash_3.png",
                title: "Title 1",
                description:
                    "description you can find all product here \n we will provide you with all updates",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
