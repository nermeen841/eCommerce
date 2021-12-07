import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import '../../constants.dart';

class SubMenueItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback press;

  const SubMenueItem({Key key, this.title, this.icon, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      title: Text(
        title,
        style: headingStyle.copyWith(
            color: HexColor("#02446E"),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      leading: Icon(
        icon,
        color: HexColor("#02446E"),
      ),
    );
  }
}
