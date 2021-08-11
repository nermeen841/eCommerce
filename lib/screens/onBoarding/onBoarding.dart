import 'package:flutter/material.dart';
import 'package:shop_app/screens/onBoarding/components/body.dart';
import 'package:shop_app/size_config.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = "/onBoarding";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
