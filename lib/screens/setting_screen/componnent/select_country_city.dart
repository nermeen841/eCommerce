import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  String countryValue;

  String stateValue;

  String cityValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SelectState(
            onCountryChanged: (value) {
              setState(() {
                countryValue = value;
              });
            },
            onStateChanged: (value) {
              setState(() {
                stateValue = value;
              });
            },
            onCityChanged: (value) {
              setState(() {
                cityValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
