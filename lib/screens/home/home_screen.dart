import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/components/fab_floating_action_button.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/components/user_location_container.dart';
import 'package:shop_app/screens/drawer/MenueItems.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  static final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Geolocator geolocator = Geolocator();

  getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        UserLocationBar.currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    this.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: HomeScreen.scaffoldKey,
        body: Body(),
        drawer: MenueItem(),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
        floatingActionButton: ExampleExpandableFab()
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: FabCircularMenu(ringColor: kPrimaryColor, children: <Widget>[
        //     IconButton(
        //         icon: Icon(
        //           FontAwesomeIcons.facebookF,
        //           color: Colors.white,
        //           size: 40,
        //         ),
        //         onPressed: () {
        //           print('Home');
        //         }),
        //     spaceW(getProportionateScreenWidth(20)),
        //     IconButton(
        //         icon: Icon(
        //           FontAwesomeIcons.whatsapp,
        //           color: Colors.white,
        //           size: 40,
        //         ),
        //         onPressed: () {
        //           print('Favorite');
        //         }),
        //     spaceW(getProportionateScreenWidth(20)),
        //     IconButton(
        //         icon: Icon(
        //           FontAwesomeIcons.facebookMessenger,
        //           color: Colors.white,
        //           size: 35,
        //         ),
        //         onPressed: () {
        //           print('Favorite');
        //         }),
        //     spaceW(getProportionateScreenWidth(20)),
        //     IconButton(
        //         icon: Icon(
        //           FontAwesomeIcons.instagram,
        //           color: Colors.white,
        //           size: 35,
        //         ),
        //         onPressed: () {
        //           print('Favorite');
        //         }),
        //     spaceW(getProportionateScreenWidth(20)),
        //     IconButton(
        //         icon: Icon(
        //           FontAwesomeIcons.phoneAlt,
        //           color: Colors.white,
        //           size: 30,
        //         ),
        //         onPressed: () {
        //           print('Favorite');
        //         }),
        //   ]),
        // ),
        );
  }
}
