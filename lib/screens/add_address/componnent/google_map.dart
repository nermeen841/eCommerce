import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PickResult selectedPlace;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // ignore: deprecated_member_use
          RaisedButton(
            child: Text("Load Google Map"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PlacePicker(
                      apiKey: "AIzaSyDzfCqXtmazGkcUXOleHdGsbMxnDoRY95w",
                      initialPosition: HomePage.kInitialPosition,
                      useCurrentLocation: true,
                      onPlacePicked: (result) {
                        selectedPlace = result;
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    );
                  },
                ),
              );
            },
          ),
          selectedPlace == null
              ? Container()
              : Text(selectedPlace.formattedAddress ?? ""),
        ],
      ),
    );
  }
}
