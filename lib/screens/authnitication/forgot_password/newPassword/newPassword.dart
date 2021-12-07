import 'package:flutter/material.dart';
import 'package:shop_app/screens/authnitication/forgot_password/newPassword/componnent/body.dart';

class NewPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: BodyNewPassoword(),
    );
  }
}
