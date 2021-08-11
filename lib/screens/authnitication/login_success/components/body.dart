import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/authnitication/login_success/components/ripple_animation.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  final String message;

  const Body({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        TwenAnimation(),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "$message",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: LocalKeys.BACKTOHOME.tr(),
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
