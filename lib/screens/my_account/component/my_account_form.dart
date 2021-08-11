// import 'package:flutter/material.dart';
// import 'package:shop_app/components/custom_surfix_icon.dart';
// import 'package:shop_app/components/default_button.dart';
// import 'package:shop_app/components/form_error.dart';
// import 'package:shop_app/screens/profile/profile_screen.dart';

// import '../../../constants.dart';
// import '../../../size_config.dart';

// class MyAccountForm extends StatefulWidget {
//   @override
//   _MyAccountFormState createState() => _MyAccountFormState();
// }

// class _MyAccountFormState extends State<MyAccountForm> {
//   final _formKey = GlobalKey<FormState>();

//   final List<String> errors = [];

//   String firstName;
//   String lastName;
//   String phoneNumber;
//   String gender;
//   void addError({String error}) {
//     if (!errors.contains(error))
//       setState(() {
//         errors.add(error);
//       });
//   }

//   void removeError({String error}) {
//     if (errors.contains(error))
//       setState(() {
//         errors.remove(error);
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             buildFirstNameFormField(),
//             SizedBox(height: getProportionateScreenHeight(30)),
//             buildLastNameFormField(),
//             SizedBox(height: getProportionateScreenHeight(30)),
//             buildPhoneNumberFormField(),
//             SizedBox(height: getProportionateScreenHeight(30)),
//             FormError(errors: errors),
//             SizedBox(height: getProportionateScreenHeight(40)),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 RadioListTile(
//                     activeColor: kPrimaryColor,
//                     value: "Female",
//                     groupValue: gender,
//                     onChanged: (val) {
//                       setState(() {
//                         gender = val;
//                       });
//                     }),
//                 RadioListTile(
//                     activeColor: kPrimaryColor,
//                     value: "Male",
//                     groupValue: gender,
//                     onChanged: (val) {
//                       setState(() {
//                         gender = val;
//                       });
//                     }),
//               ],
//             ),
//             DefaultButton(
//               text: "Edit Profile",
//               press: () {
//                 if (_formKey.currentState.validate()) {
//                   Navigator.pushNamed(context, ProfileScreen.routeName);
//                 }
//               },
//             ),
//           ],
//         ));
//   }

//   TextFormField buildPhoneNumberFormField() {
//     return TextFormField(
//       initialValue: "01062015106",
//       keyboardType: TextInputType.phone,
//       onSaved: (newValue) => phoneNumber = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kPhoneNumberNullError);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value.isEmpty) {
//           addError(error: kPhoneNumberNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Phone Number",
//         hintText: "Enter your phone number",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
//       ),
//     );
//   }

//   TextFormField buildLastNameFormField() {
//     return TextFormField(
//       initialValue: "Ramadan",
//       onSaved: (newValue) => lastName = newValue,
//       decoration: InputDecoration(
//         labelText: "Last Name",
//         hintText: "Enter your last name",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
//       ),
//     );
//   }

//   TextFormField buildFirstNameFormField() {
//     return TextFormField(
//       initialValue: "Nermeen",
//       onSaved: (newValue) => firstName = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kNamelNullError);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value.isEmpty) {
//           addError(error: kNamelNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "First Name",
//         hintText: "Enter your first name",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
//       ),
//     );
//   }
// }
