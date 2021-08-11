import 'package:flutter/material.dart';
import 'package:shop_app/screens/AboutUs/componnent/aboutus_body.dart';

class AboutUsScreen extends StatelessWidget {
  static String routeName = "/about_us";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AboutusBody(),
    );
  }
}
