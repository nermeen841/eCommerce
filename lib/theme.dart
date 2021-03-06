import 'package:flutter/material.dart';
import 'package:shop_app/components/constans.dart';
import 'constants.dart';

ThemeData theme() {
  var inActiveIconColor;
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xFFF5F6F9),
    cardColor: kTextColor,
    iconTheme: IconThemeData(color: inActiveIconColor),
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,

    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    // ignore: deprecated_member_use
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    // ignore: deprecated_member_use
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: HexColor("#333333"),
    scaffoldBackgroundColor: Colors.black,
    fontFamily: "Muli",
    cardColor: Colors.white,
    unselectedWidgetColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.black26,
      elevation: 0,
      // ignore: deprecated_member_use
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      // ignore: deprecated_member_use
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixStyle: TextStyle(color: Colors.white),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: TextStyle(color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.white),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.white),
        gapPadding: 10,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.white),
        gapPadding: 10,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
