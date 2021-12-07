import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/authnitication/complete_profile/complete_profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conformPassword;
  String phoneNumber;
  String firstName;
  String lastName;
  bool remember = false;
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstnameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastnameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: LocalKeys.CONTBUTTON.tr(),
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conformPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: LocalKeys.PASSEMPTY.tr());
        } else if (value.isNotEmpty && password == conformPassword) {
          removeError(error: LocalKeys.PASSMATCHERROR.tr());
        }
        conformPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: LocalKeys.PASSEMPTY.tr());
          return "";
        } else if ((password != value)) {
          addError(error: LocalKeys.PASSMATCHERROR.tr());
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocalKeys.CONFIRMPASSWORDLABEL.tr(),
        hintText: LocalKeys.CONFIRMPASSWORDHINT.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: LocalKeys.PASSEMPTY.tr());
        } else if (value.length >= 8) {
          removeError(error: LocalKeys.PASSSHORT.tr());
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: LocalKeys.PASSEMPTY.tr());
          return "";
        } else if (value.length < 8) {
          addError(error: LocalKeys.PASSSHORT.tr());
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocalKeys.LABELLOGINPASS.tr(),
        hintText: LocalKeys.HINTLOGINPASS.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: LocalKeys.EMAILEMPTY.tr());
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: LocalKeys.EMAILERROR.tr());
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: LocalKeys.EMAILEMPTY.tr());
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: LocalKeys.EMAILERROR.tr());
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocalKeys.LABELLOGINMAIL.tr(),
        hintText: LocalKeys.HINTLOGINMAIL.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildFirstnameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "this field is required");
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: "this field is required");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "this field is required");
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: "this field is required");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "First Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildLastnameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "this field is required");
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: "this field is required");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "this field is required");
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: "this field is required");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Last Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: LocalKeys.PHONEEMPTY.tr());
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: LocalKeys.PHONEEMPTY.tr());
          return "";
        } else if (value.length < 11) {
          addError(error: LocalKeys.PHONEERROR.tr());
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: LocalKeys.PHONENUMLABEL.tr(),
          hintText: LocalKeys.PHONENUMHINT.tr(),
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.phone_android_outlined)
          // CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
          ),
    );
  }
}
