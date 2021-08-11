import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/user_location_container.dart';
import 'package:shop_app/screens/onBoarding/onBoarding.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/spllash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Geolocator geolocator = Geolocator();

  getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        UserLocationBar.currentPosition = position;
        // TapToSeeOffers.hasLocation = true;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    this.getCurrentLocation();
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushNamed(OnBoardingScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/139905-OT30AT-347.jpg"),
                  fit: BoxFit.contain,
                )),
            // child: Image.asset(
            //   "assets/images/139905-OT30AT-347.jpg",
            //   fit: BoxFit.contain,
            // ),
          ),
        ),
      ),
    );
  }
}
