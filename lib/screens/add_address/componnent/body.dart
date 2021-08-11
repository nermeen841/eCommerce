import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/UserAddress/userAddress.dart';
import 'package:shop_app/screens/add_address/address_provider.dart';
import 'package:shop_app/screens/home/components/user_location_container.dart';
import 'package:shop_app/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants.dart';
import '../address_card.dart';

// ignore: must_be_immutable
class AddressFormBody extends StatefulWidget {
  @override
  _AddressFormBodyState createState() => _AddressFormBodyState();
}

class _AddressFormBodyState extends State<AddressFormBody> {
  final _formKey = GlobalKey<FormState>();
  String buldingNum;
  String home;
  String floor;
  String flat;
  PickResult selectedPlace;

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  getInitialPosition() {
    if (Provider.of<MapDataProvider>(context, listen: false).long != '') {
      return LatLng(
          double.parse(
              Provider.of<MapDataProvider>(context, listen: false).lat),
          double.parse(
              Provider.of<MapDataProvider>(context, listen: false).long));
    }
    if (UserLocationBar.currentPosition.latitude != null ||
        UserLocationBar.currentPosition.longitude != null) {
      return LatLng(UserLocationBar.currentPosition.latitude,
          UserLocationBar.currentPosition.longitude);
    } else {
      return LatLng(31.1975844, 29.9598339);
    }
  }

  @override
  void initState() {
    this.getInitialPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(10),
              horizontal: getProportionateScreenWidth(10)),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: PlacePicker(
                      enableMapTypeButton: false,
                      enableMyLocationButton: false,
                      apiKey: "AIzaSyDzfCqXtmazGkcUXOleHdGsbMxnDoRY95w",
                      useCurrentLocation: true,
                      selectedPlaceWidgetBuilder:
                          (_, result, state, isSearchBarFocused) {
                        if (isSearchBarFocused) {
                          return Container();
                        } else {
                          if (state == SearchingState.Searching) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            Future.delayed(Duration.zero, () {
                              Provider.of<MapDataProvider>(context,
                                      listen: false)
                                  .updataData(
                                address: result.formattedAddress.toString(),
                                lat: result.geometry.location.lat.toString(),
                                long: result.geometry.location.lng.toString(),
                              );
                            });
                            return Container();
                          }
                        }
                      },
                      initialPosition: getInitialPosition(),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  AddressCart(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildHomeAddressFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildBuildingnumFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildFloorFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildFlateFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  DefaultButton(
                    text: "Add Address",
                    press: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.pushNamed(
                            context, UserAddressScreen.routeName);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildHomeAddressFormField() {
    return TextFormField(
      obscureText: false,
      onSaved: (newValue) => home = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kHomeErrorval);
        } else if (value.isNotEmpty) {
          removeError(error: kHomeErrorval);
        }
        home = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kHomeErrorval);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocalKeys.HOMEADDRESS.tr(),
        hintText: LocalKeys.HOMEADDRESS.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildBuildingnumFormField() {
    return TextFormField(
      obscureText: false,
      onSaved: (newValue) => buldingNum = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kbuildingNumErrorval);
        } else if (value.isNotEmpty) {
          removeError(error: kbuildingNumErrorval);
        }
        buldingNum = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kbuildingNumErrorval);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocalKeys.BUILDNUMBER.tr(),
        hintText: LocalKeys.BUILDNUMBER.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildFloorFormField() {
    return TextFormField(
      obscureText: false,
      onSaved: (newValue) => floor = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kfloorErrorval);
        } else if (value.isNotEmpty) {
          removeError(error: kfloorErrorval);
        }
        floor = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kfloorErrorval);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocalKeys.FLOORNUM.tr(),
        hintText: LocalKeys.FLOORNUM.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildFlateFormField() {
    return TextFormField(
      obscureText: false,
      onSaved: (newValue) => flat = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kflateErrorval);
        } else if (value.isNotEmpty) {
          removeError(error: kflateErrorval);
        }
        flat = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kflateErrorval);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocalKeys.FLATNUM.tr(),
        hintText: LocalKeys.FLATNUM.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
