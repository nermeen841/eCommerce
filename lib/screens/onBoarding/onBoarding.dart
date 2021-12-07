import 'package:flutter/material.dart';
import 'package:shop_app/CacheHelper/mySharedPreference.dart';
import 'package:shop_app/screens/authnitication/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/onBoarding/components/body.dart';
import 'package:shop_app/size_config.dart';

class OnBoardingScreen extends StatefulWidget {
  static bool onBording = false;

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isOnboarding = false;

  getOnBoarding() async {
    OnBoardingScreen.onBording = await CacheHelper.getOnboarding();
    setState(() {
      isOnboarding = OnBoardingScreen.onBording;
    });
  }

  @override
  void initState() {
    this.getOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isOnboarding == true) {
      return SignInScreen();
    } else {
      return OnBoard();
    }
  }
}

class OnBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
