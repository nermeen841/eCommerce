import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/CacheHelper/mySharedPreference.dart';
import 'package:shop_app/components/constans.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/authnitication/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/authnitication/login_success/login_success_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import 'package:easy_localization/easy_localization.dart';

class SignForm extends StatefulWidget {
  static String lang;
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
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

  getlang() async {
    SignForm.lang = await CacheHelper.getLang();
    return SignForm.lang;
  }

  @override
  void initState() {
    this.getlang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          InkWell(
            onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocalKeys.SKIPBUTTON.tr(),
                  style: headingStyle.copyWith(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                spaceW(20),
                (applang() == "en")
                    ? SvgPicture.asset(
                        "assets/icons/right-arrow-angle-of-two-shapes.svg",
                        width: 20,
                        height: 20,
                        color: kPrimaryColor,
                      )
                    : SvgPicture.asset(
                        "assets/icons/double-left-arrows-angles.svg",
                        width: 20,
                        height: 20,
                        color: kPrimaryColor,
                      ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text(LocalKeys.REMEMBERME.tr()),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  LocalKeys.FORGETPASSWORD.tr(),
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: LocalKeys.CONTINUEBUTTON.tr(),
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginSuccessScreen(message: "Login Success")));
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
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
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
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
}
