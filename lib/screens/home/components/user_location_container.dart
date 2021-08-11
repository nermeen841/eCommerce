import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/constants.dart';

class UserLocationBar extends StatefulWidget {
  static Position currentPosition;
  @override
  _UserLocationBarState createState() => _UserLocationBarState();
}

class _UserLocationBarState extends State<UserLocationBar> {
  final Geolocator geolocator = Geolocator();

  String currentAddress;

  @override
  void initState() {
    this._getCurrentLocation();
    super.initState();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        UserLocationBar.currentPosition = position;
      });
      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          UserLocationBar.currentPosition.latitude,
          UserLocationBar.currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        currentAddress =
            "${place.name},${place.locality}, ${place.subAdministrativeArea}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return (UserLocationBar.currentPosition != null && currentAddress != null)
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.only(left: 5, right: 5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              // HexColor("#00224B"),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/location-pin.svg",
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
                spaceW(5),
                SizedBox(
                  width: 300,
                  child: Text(currentAddress,
                      maxLines: 2,
                      style: headingStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              ],
            ),
          )
        : Container();
  }
}
