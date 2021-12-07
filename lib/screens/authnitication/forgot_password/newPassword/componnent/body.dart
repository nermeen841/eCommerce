import 'package:flutter/material.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/authnitication/forgot_password/newPassword/componnent/newPasswordForm.dart';
import '../../../../../size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class BodyNewPassoword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text(LocalKeys.RESETPASSWORDTITLE.tr(),
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: getProportionateScreenWidth(28),
                          fontWeight: FontWeight.bold,
                        )),
                Text(
                  LocalKeys.RESETPASSWORDINTRO.tr(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                NewPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
