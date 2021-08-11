import 'package:flutter/material.dart';
import 'package:shop_app/screens/authnitication/forgot_password/newPassword/componnent/body.dart';

class NewPassword extends StatelessWidget {
  static String routeName = "/new_Password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BodyNewPassoword(),
    );
  }
}
