import 'package:flutter/material.dart';
import 'package:shop_app/screens/All_Product_bottomNavy/all_product_screen.dart';
import 'package:shop_app/screens/drawer/section%20_menue_item.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'oneMenueItem.dart';

class MenueItem extends StatefulWidget {
  @override
  _MenueItemState createState() => _MenueItemState();
}

class _MenueItemState extends State<MenueItem> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 350,
              height: 350,
              fit: BoxFit.cover,
            ),
          )),
          Container(
            color: Colors.white,
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SubMenueItem(
                  title: "Home",
                  icon: Icons.home,
                  press: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
                SubMenueItem(
                    title: "All Product",
                    icon: Icons.list,
                    press: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllProductBottom()));
                    }),
                SubMenueItem(
                    title: "Privacy Policy",
                    icon: Icons.lock,
                    press: () async {}),
                SubMenueItem(
                  title: "Contact Us",
                  icon: Icons.phone_in_talk,
                  press: () async {},
                ),
                SubMenueItem(
                  title: "Who we are",
                  icon: Icons.article,
                  press: () {},
                ),
                SectionMenueItem(
                  text1: "Section 1",
                  text2: "400 item",
                  press: () {},
                ),
                SectionMenueItem(
                  text1: "Section 2",
                  text2: "40 item",
                  press: () {},
                ),
                SectionMenueItem(
                  text1: "Section 3",
                  text2: "10 item",
                  press: () {},
                ),
                SectionMenueItem(
                  text1: "Section 4",
                  text2: "30 item",
                  press: () {},
                ),
                SubMenueItem(
                  title: "Log out",
                  icon: Icons.logout_outlined,
                  press: () async {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
