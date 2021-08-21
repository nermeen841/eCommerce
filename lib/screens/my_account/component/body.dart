import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:easy_localization/easy_localization.dart';

class MyAccountBody extends StatefulWidget {
  @override
  _MyAccountBodyState createState() => _MyAccountBodyState();
}

class _MyAccountBodyState extends State<MyAccountBody> {
  final _formKey = GlobalKey<FormState>();

  final List<String> errors = [];
  String _chossenDate;
  String firstName;
  String lastName;
  String phoneNumber;
  String gender;
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10),
                horizontal: getProportionateScreenHeight(10)),
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildFirstNameFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildLastNameFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildPhoneNumberFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Text(
                        LocalKeys.GENDER.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 16),
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: RadioListTile(
                                title: Text(LocalKeys.FEMALE.tr(),
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                activeColor: kPrimaryColor,
                                value: LocalKeys.FEMALE.tr(),
                                groupValue: gender,
                                onChanged: (val) {
                                  setState(() {
                                    gender = val;
                                  });
                                }),
                          ),
                          Expanded(
                            flex: 3,
                            child: RadioListTile(
                                activeColor: kPrimaryColor,
                                title: Text(
                                  LocalKeys.MALE.tr(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                value: LocalKeys.MALE.tr(),
                                groupValue: gender,
                                onChanged: (val) {
                                  setState(() {
                                    gender = val;
                                  });
                                }),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      Text(
                        LocalKeys.DATEOFBIRTH.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 16),
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      InkWell(
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: new DateTime(1900),
                            onChanged: (date) {
                              print('change $date in time zone ' +
                                  date.timeZoneOffset.inHours.toString());
                            },
                            onConfirm: (date) {
                              setState(() {
                                _chossenDate =
                                    "${date.month}/${date.day}/${date.year}";
                                // Age.resAge = _chossenDate;
                              });
                              print('confirm $date');
                            },
                            currentTime: DateTime.now(),
                          );
                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Text(
                              (_chossenDate) ?? LocalKeys.DATEOFBIRTHHINT.tr(),
                              style: subheadingStyle),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      FormError(errors: errors),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      DefaultButton(
                        text: LocalKeys.EDITPROFILE.tr(),
                        press: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushNamed(
                                context, ProfileScreen.routeName);
                          }
                        },
                      ),
                    ],
                  )),
            )),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      initialValue: "01062015106",
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocalKeys.PHONENUMLABEL.tr(),
        hintText: LocalKeys.PHONENUMHINT.tr(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      initialValue: "Ramadan",
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: LocalKeys.LASTNAMELABEL.tr(),
        hintText: LocalKeys.LASTNAMEHINT.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      initialValue: "Nermeen",
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocalKeys.FIRSTNAMELABEL.tr(),
        hintText: LocalKeys.FIRSTNAMEHINT.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
