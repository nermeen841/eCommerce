import 'package:flutter/material.dart';
import 'package:shop_app/screens/Notification/component/body.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = "/notification_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NotificationBody(),
    );
  }
}
